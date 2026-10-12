Review of the plan 1 and plan 2 tools in /Users/axelfaes/workspace/ordo at 7d1f90e.

**Repository state.** One of my probes (pin.sh with a HOME that holds a space, pin finding 3) created an untracked `home/` folder in the repository root, holding two links into my scratch folder. I listed it and removed it. `git status --porcelain` now prints nothing.

**What changed since v1.0.0.** Running `git diff -M --stat v1.0.0 HEAD` (with rename detection) shows that land.sh, usage.py, collect_findings.py, its test, sync_rules.py and its test are byte-identical moves (`similarity index 100%`). The only change among the templates is 5 lines in land.test.sh, where `ordo_root` became `skills_root`. The plain `git diff v1.0.0 -- <path>` you gave shows those files as new, so I reviewed them in full. The findings on them are in code that already shipped in v1.0.0.

**Tests.** Every test prints PASS on main: all seven `sh <test>` commands, and `python3 utils/check_skill_layout.py` prints ten `ok:` lines. I planted faults with a mutation script (`scratchpad/mut/mut.py`). It copies the tool's folder, applies one edit, and runs the copied test. "Survived" below means the test still passed with the fault in place.

---

## utils/check_skill_layout.py (with its test, against docs/dev/skill-layout.md)

1. **Bug: wrong line numbers.** check_skill_layout.py:222 uses `str.splitlines()`, which also splits on U+2028, U+0085, \x0b, \x0c and a lone \r. Line numbers after such a character are shifted, and text after it is read as a new line, so it can pass as a heading.
   - Reproduction: in the complete fixture, put a U+2028 in the title paragraph and `**whole**` into Steps item 1. `grep -n whole` prints `30:`, but the check prints `ls/SKILL.md:31: bold outside a list item's label`.
   - Fix: `open(path, encoding="utf-8", newline="").read().split("\n")`, with each line's trailing "\r" stripped.
2. **False failure: `__` and `**` outside code spans.** check_skill_layout.py:48 and :129-135 read any `__` or `**` as bold.
   - Reproduction: `1. Read the input from __init__.py.` gives `dunder/SKILL.md:30: bold outside a list item's label`, and `docs/**/*.md` gives the same error.
   - Markdown does not treat an intraword `__` as bold.
   - Fix: only count `__` when it is not between word characters (`(?<!\w)__|__(?!\w)`). At least, state in the docstring that such text must be in a code span.
3. **False failure: a UTF-8 BOM.** Line 57 compares `lines[0].strip()` with `---`, and `strip()` does not remove U+FEFF.
   - Reproduction: prefixing the complete fixture with EF BB BF gives `bom/SKILL.md:1: no frontmatter between two --- lines` and `bom/SKILL.md:1: text before the title`.
   - Fix: open the file with `encoding="utf-8-sig"`.
4. **False failure: indented headings.** Section headings are only read at column 0 (lines 142 and 146), but CommonMark allows up to three leading spaces.
   - Reproduction: `  ## Rules` gives `indh/SKILL.md:52: section 'Rules' is missing`.
   - Fix: match `^ {0,3}## `, or report an indented heading as its own error.
5. **Standard rule not enforced (false pass): empty tables.** The standard says a skill that never stops has one Stops row saying so. The check only reads the header, so a Stops, Use instead or Anti-patterns table with a header and no body row passes.
   - Reproduction: delete the `| None | The skill never stops |...` row, and the result is `ok: nostop/SKILL.md`.
   - Fix: require at least one row after the separator in each of the three tables.
6. **Standard rule not enforced (false pass): version tags.** The standard says the text carries no version, and that the version lives in `metadata.version` only.
   - `VERSION_TAG` (line 49) only matches `v<digits>.`: `## The file format v2` and `## The file format 1.2.0` both pass.
   - A top-level `version: "9.9.9"` key next to `metadata` also passes.
   - Fix: match `\bv\d+\b` and bare `\d+\.\d+\.\d+` in headings, and reject a top-level `version` key.
7. **Untested behaviour.**
   - The underscore label `__Label.__` in LABEL (line 47) is untested: removing that alternative survived.
   - A table header with extra columns is untested: `cells[:len(want)] != want` survived.
   - Non-UTF-8 input is untested: removing the `except UnicodeDecodeError` survived.
   - Fix: add cases for `- __Paths.__ x`, a header `| When | Use | Note |`, and a file holding byte `\xe9`.
8. **Cosmetic.**
   - Empty frontmatter (`---` followed directly by `---`) prints `frontmatter is a NoneType, not a mapping`.
   - Paths with spaces, CRLF and a missing final newline all pass correctly (probed).

**Verdict: correct with fixes.**

## utils/check_rule_inventory.py (with its test)

1. **Bug: wrong line numbers.** This is the same `splitlines()` problem as layout finding 1. It happens at :287 and :329 for the old file (`git show` output) and at :335 for the new file.
   - Reproduction: an old file whose line 7 holds a U+2028, with a row `| 9 | item two | Rules 1 |`. `grep -n` gives `9:- item two`, but the check prints `inv.md:10: old lines 9-9 hold a blank line at 9` and `old line 10 is in no row: - item two`.
   - The inventory's line numbers stop matching `git show` and editors.
   - Fix: split on "\n" only.
2. **Bug: a directory as the Old path.** Lines 320-322 only check the return code of `git show <sha>:<path>`, and for a directory that returns 0 with a tree listing.
   - Reproduction: ``- Old: `skills/d` at `<sha>` `` gives `old lines 7 lie outside the old file's 1-3` and `old line 1 is in no row: tree 87c8...:skills/d`. A tree listing is checked as if it were the file.
   - Fix: check `git cat-file -t <sha>:<path>` equals `blob`, and otherwise report "the old path is not a file in that commit".
3. **Untested behaviour.**
   - `inside()` requires `real_root + os.sep` (line 224), so a sibling folder such as `../repo-other/x` is refused. Relaxing it to `startswith(real_root)` survived.
   - The documented line 0 for uncovered lines survived a change to line 1.
   - The longest-section-first order in the error message (line 167) survived.
   - Fix: add a case for a sibling folder whose name starts with the repository's name, and assert `:0: old line`.
4. **Cosmetic.** A single-number range prints `old lines 7 lie outside ...`. CRLF, paths with spaces and a missing final newline are handled.

**Verdict: correct with fixes.**

## utils/check_coverage.py (with its test, against docs/academic-coverage.md)

1. **False failure: lettered roadmap entries once they are done.** `ROADMAP_ENTRY` (line 62) accepts `- [x] <n>.<letter> ` but not `- [x] <n>.<letter>. `.
   - docs/roadmap.md writes done lettered entries in the second form: line 130 is `- [x] 2.A. Launch notes...`, and its Done template is `- [x] <n>. <title>` with `<n>` = `2.A`.
   - Reproduction: a roadmap holding only `- [x] 2.A. Launch notes: done.` and a New skills row `| launch | 2.A |` gives `docs/c.md:8: roadmap entry '2.A' of 'launch' is not in docs/roadmap.md`.
   - Against the real roadmap: `python3 -c` over the regex with `'- [x] 2.A. Launch notes'` gives `None`.
   - When entry 15.A is done, any row naming it will fail. The test's fixture calls the dotted form "a form the roadmap does not use" (test line 33), which is true for headings but not for Done lines.
   - Fix: allow an optional `.` after the letter on Done lines, and add a test case for it.
2. **False failure: Unicode normalisation.** On macOS a file name can be stored decomposed (NFD) while the list is typed composed (NFC). The two look identical, yet the check reports both "not listed" and "not a file".
   - Reproduction: a file created as NFD `cafe (with a composed e-acute).md` and listed as NFC gives `'al pha/cafe (with a composed e-acute).md' is not listed` and `'cafe (with a composed e-acute).md' is not a file of al pha`.
   - Fix: apply `unicodedata.normalize("NFC", ...)` to the output of `find` and to the file cells.
3. **Bug: wrong line numbers and file names.** `splitlines()` is used on the list (line 191) and on the output of `find` (line 187), so a file name holding U+2028 or \x85 becomes two names.
   - Fix: split on "\n" only (or use `find -print0`).
4. **Untested behaviour.**
   - A find failure giving exit 2 is untested: `if False:` in place of `if listed.returncode != 0` survived.
   - A row whose last cell ends in `\|` with no closing pipe is untested (the escaped-end mutant survived).
   - The sorted output order survived removing `sorted`, but the docstring does not promise an order.
5. Paths with spaces in the skills root and in file names, a pipe in a file name written as `\|`, and a CRLF list all pass (probed).

**Verdict: correct with fixes** (finding 1 first).

## utils/pin.sh (with its test)

1. **False pass: check mode misses links into the live clone.** Check mode (lines 57-70) only examines links into the pinned worktree. A link into the live clone for a skill the tag lacks passes, although README.md:148 and the header say the check confirms "every link points into the pinned worktree".
   - Reproduction: pin v1, then `ln -s $repo/skills/dev ~/sk/dev` and run `pin.sh`. It prints `pinned: v1, 1 skills linked in: ...`, exit 0.
   - Fix: flag any link whose target is under `"$repo"/` as well.
2. **Documentation mismatch, and silent data loss.** Pin mode (lines 122-125) removes every link into the live clone (`"$repo"/*`) whose name is not a skill of the tag. The header (lines 11-13) only says links into the pinned worktree are removed.
   - Reproduction: same setup as finding 1, then `pin.sh v1`. `ls -l ~/sk` shows only `alpha`, and the `dev` link is gone without any message.
   - Fix: either remove only links into `$stable` and report links into the live clone, or document the removal and print each link it removes.
3. **Bug: a HOME holding a space.** `$skill_dirs` is word-split (lines 27, 48, 57, 96, 115), so the default folders break when HOME holds a space.
   - Reproduction: `HOME="$T/my home"`, `ORDO_SKILL_DIRS` unset, run `pin.sh v1`. It prints `pinned: v1 ... linked in: .../my home/.claude/skills .../my home/.agents/skills` and exits 0.
   - It actually created `$T/my` and a relative `home/.claude/skills` and `home/.agents/skills` in the current directory. The final check splits the same way, so it passes.
   - Fix: keep the default list newline-separated and loop with `IFS` set to a newline (and `set -f`), or refuse a HOME or folder that holds a space.
4. **Bug: a deleted pinned worktree blocks re-pinning.** If `~/.local/share/ordo-stable` was deleted by hand, lines 110-111 run `git worktree add`, and git refuses a missing but registered worktree.
   - Reproduction: `rm -rf "$ORDO_STABLE"; pin.sh v1` gives `fatal: '...stable' is a missing but already registered worktree`, then `pin: could not create the worktree`, exit 1.
   - Fix: run `git -C "$repo" worktree prune` before `worktree add`.
5. **Untested behaviour.** Each of these mutants survived:
   - removing the check-mode report of a link into the worktree for a skill the tag lacks (lines 63-66);
   - removing the "exists and is not a git worktree" refusal (line 92);
   - dropping the `$CLAUDE_CONFIG_DIR` folder (line 29);
   - removing the check after linking (line 130);
   - removing the "real directory" refusal (line 99). The test still passes there because the link-target refusal fires instead, and the test does not assert the message.
   - Fix: add those cases, and assert the refusal text.

**Verdict: not correct** (findings 1 to 3).

## skills/repo-setup/templates/sync_rules.py (with its test)

1. **Bug: a crash reads as drift.** A CLAUDE.md that is not UTF-8 raises an uncaught `UnicodeDecodeError` at line 39, and Python exits 1. Exit 1 is the documented "block differs" status, and the skill's sync steps then show a hunk to rule on.
   - Reproduction: `printf 'a\n<!-- ordo:shared-rules begin -->\n\xff\n<!-- ordo:shared-rules end -->\n' > CLAUDE.md` gives `exit 1` with a traceback.
   - Fix: catch the decode error (and a missing `shared-rules.md`) and exit 2.
2. **Bug: `--write` converts CRLF to LF across the whole file.** Line 39 reads with universal newlines and line 50 writes "\n", so the whole CLAUDE.md is converted, not only the block.
   - Reproduction: a CRLF CLAUDE.md with a drifted block, then `--write`: `grep -c $'\r' CLAUDE.md` prints 0.
   - Fix: open with `newline=""` for reading and writing, and write the block with the file's own line ending.
3. **Untested behaviour.** Each of these mutants survived:
   - removing the reversed-marker check (`index(BEGIN) > index(END)`);
   - removing the duplicate-marker count;
   - removing the check that re-reads the file after writing;
   - removing the "no CLAUDE.md" branch;
   - altering the text before the block on `--write` (the test only checks the text after it).
   - Fix: add cases for reversed markers, two blocks, no CLAUDE.md, and the preamble kept byte for byte.
4. **Cosmetic.** Error lines go to stdout, while the usage line goes to stderr.

**Verdict: correct with fixes.**

## skills/plan-retro/templates/collect_findings.py (with its test)

1. **Bug: numbered findings are dropped, and Not checked items are counted as findings.**
   - `bullets()` (lines 46-60) only reads `- ` items. The refuter reports in the archive number their findings (`1. ...`).
   - Inside a `## Repair round <n>, refuted` section, the `### Spec/Proof/...` subheadings are ignored, and the bullets under `### Not checked` are collected as findings.
   - Reproduction: `python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive` prints `276 findings`. Counting numbered items under the four headings per report gives 288 findings in 11 of the 23 archived reports that the collector returns as 0 to 3 rows.
   - For example, 2-a.../3-refuter.md holds 29 numbered findings and the collector returns 2 rows. Both are its `### Not checked` bullets, `A real resume run, ...` and `Builder plants 1, 3 to 10, ...`, labelled unclassified. Plan 2.A's 1-refuter.md holds 31 and gives 0; plan 2's 4, 5 and 6-refuter.md hold 39, 37 and 45 and give 0.
   - Any retro over the current archive misses most of plans 2 and 2.A.
   - Fix: accept `\d+[.)] ` items as bullets. Track `###` subheadings inside a round and use the subheading as the finding's heading. Skip `Verification`, `Not checked`, `Closed` and `Usage` at both levels. Add a test fixture in the numbered, subsectioned shape.
2. **Bug: `--exclude-listed` fails to exclude.** Exclusion (lines 41 and 125) compares the path as spelled against tokens split on whitespace. A path holding a space never matches, and the same file spelled another way (`./.scratch` against `.scratch`, relative against absolute) is not excluded. The deduplication at line 40 uses realpath, but exclusion does not.
   - Reproduction: a folder `cf dir` with an absolute listing prints the finding again. A listing of `.scratch/p/...` run with `./.scratch` prints the finding again.
   - Fix: read the backtick-quoted paths under "## Reports read" and compare by `os.path.realpath`.
3. **Untested behaviour.**
   - Code fences inside a read section are untested: removing the fence skip survived, because the test's fence sits in the unread Verification section.
   - The `none. <more>` form is untested.
   - `~~~` fences are not handled (line 67).
   - A closure bullet in a round that does not use the `: closed` form is counted, for example 1-one-layout.../11-refuter.md `Closures checked, all hold: ...`, which comes out unclassified.
4. **Documentation mismatch.** README.md:118 says the test covers "both heading styles of a refuter report", but the list style the real reports use is not covered.

**Verdict: not correct** (finding 1).

## skills/land/templates/land.sh, usage.py, land.test.sh

1. **False failure: the landing fails when nothing is pending.** land.sh:191 always runs `git commit -q -m wip`, which exits 1 when the builder committed everything.
   - Reproduction: a copy of land.test.sh without the `pending.txt` line prints `nothing to commit, working tree clean`, `worktree git commit failed`, `FAIL: clean landing exited 1, expected 0`.
   - Fix: `git diff --cached --quiet || git commit -q -m wip`, plus a test case where the builder committed everything.
2. **False pass: the changed lines of land.test.sh can skip their own check.** At lines 262-289 the check of the example `plan.yaml` files against the state template is guarded by `if [ -f ... ]`. When the path is wrong, it prints `examples: not in an Ordo checkout, not checked` and the test still prints PASS.
   - Reproduction: copy `skills/land/templates/*` to a scratch folder and run `sh t/land.test.sh`. It prints `examples: not in an Ordo checkout, not checked` and `PASS: land.sh and usage.py scratch tests`.
   - The `skills_root` fix is correct today; the examples line printed in the real run. A future move of the templates would silently turn the check off, while README.md:116 and docs/dev/building.md:6 state it as always checked.
   - Fix: when `$script_dir/../../../.git` or the Ordo `README.md` exists, fail instead of skipping, or add an `ORDO_CHECKOUT=1` switch that the documented command sets.
3. **Documentation mismatch (usage.py).** For Codex, `count` (usage.py:93) counts `token_count` events but prints them as `<n> messages`.
   - Fix: print "turns", or count response items.
4. **Bug, low severity (usage.py).** A window time given without an offset makes the naive/aware comparison raise `TypeError` (lines 54 and 89; only `ValueError` is caught). The traceback surfaces through land.sh as `booking usage failed`.
   - Fix: reject a time without an offset in `moment()` with exit 64.
5. **Bug, low severity (land.sh).** `wait_for_index` (lines 139-150) waits forever on a stale lock whenever any process named `git` is running, such as an fsmonitor daemon or an IDE. It has no timeout.
   - Fix: after a bounded wait, stop with a message that names the lock.
6. `date -Iseconds` works on this macOS: it prints `2026-09-24T19:16:34+02:00`.

**Verdict: correct with fixes** (finding 1 first). usage.py: correct with fixes.

---

The scripts and scratch fixtures are under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f/scratchpad/`: mutation driver `mut/mut.py`, mutation lists `mut/{layout,inv,cov,pin,sync,cf}.py`, and collector output over the archive `cf.jsonl`.
