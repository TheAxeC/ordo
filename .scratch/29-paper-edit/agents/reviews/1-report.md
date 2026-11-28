Everything in the brief is done.

## Open items of the state file

- none.

## The cases' first run

Every case was run on the unchanged scripts, before any change to them: the new cases were added to the two test files, and each test was run with the scripts as they stand at the base (b602b0a). The full output of those two runs is quoted below, each line as printed. The existing cases P1 to P11 and A1 to A4 print no line in either run, so they held on the unchanged tree; the base copies of both tests, run on base copies of the scripts from `git show HEAD:...` in the scratchpad, printed the two `PASS:` lines quoted under "Preserved behaviour". No case of the brief turned out wrong under its own rules, so no ruling was needed.

| Case of the brief | Test name | First run on the unchanged tree |
|---|---|---|
| `fill_gap` applied | G1 | FAIL: `G1 exit status`, `G1 the output None`, `G1 the report names the op` (unknown kind) |
| `fill_gap` with the second occurrence | G2 | FAIL: `G2 exit status`, `G2 only the second None` |
| Two `fill_gap` ops on one block | G3 | FAIL: `G3 exit status`, `G3 both filled None` |
| Two `fill_gap` ops on the same occurrence | G4 | FAIL: `G4 the problem` (two unknown-kind problems, none naming both ops and the occurrence) |
| A `fill_gap` and a `replace_block` on one block | G5 | FAIL: `G5 the problem` |
| `occurrence` above the count | G6 | FAIL: `G6 the problem` |
| `occurrence` 0, `-1`, `"1"`, `true` | G7 0, G7 -1, G7 the string, G7 true | FAIL: `the problem` for each of the four |
| `marker` not a gap marker | G8 not a gap marker | FAIL: `G8 not a gap marker the problem` |
| `marker` spans two gaps | G8 two gaps | FAIL: `G8 two gaps the problem` |
| `fill_gap` with a `new_text` | G9 | FAIL: `G9 the problem` |
| Blank `answer`, `answer` holding a blank line | G10 blank, G10 a blank line | FAIL: `the problem` for each |
| `answer` `\cite{doe2020}` | G11 a cite command | FAIL: exit 2, unknown kind |
| `answer` holding a gap marker | G11 a gap marker | FAIL: exit 2, unknown kind |
| `fill_gap` on `\section{[GAP: title]}` | G12 | FAIL: `G12 exit 3` (exit 2, validation) |
| `fill_gap` ops on every block of a two-block file | G13 | FAIL: `G13 applied with no flag`, `G13 the output` |
| `--allowed-blocks` `B0002 fill_gap`, `replace_block` on B0002 | L1 | FAIL: `standard output is JSON` (argparse usage error), `L1 exit status and kind`, `L1 the problem` |
| `--allowed-blocks` B0002 only, op on B0003 | L2 | FAIL: `L2 exit status and kind`, `L2 the problem` |
| `--allowed-blocks` one op of each allowed kind | L3 | FAIL: `L3 applied` |
| `--allowed-blocks` both blocks of a two-block file, `replace_block` on each | L4 | FAIL: `L4 applied with no flag` |
| `--allowed-blocks` with `--check-only`, op outside | L5 | FAIL: `L5 exit status and kind`, `L5 the problem` |
| `--allowed-blocks` malformed `B0002`, `fil_gap`, a block on two lines, an id not in the manifest, a missing path | L6 a block id alone, an unknown kind, a block on two lines, an id the manifest does not hold, a path that does not exist | FAIL: each, stderr "unrecognized arguments" without the reason text |
| No `fill_gap`, no `--allowed-blocks` | P1 to P11 | Held: no P line printed, and the base test printed its `PASS:` line |
| `--find 'Author Name'` on the template | F1 | FAIL: `F1 exit status`, `F1 the blocks ''` |
| `--find` text not held | F2 | FAIL: `F2 exit status and output` (exit 2) |
| `--find 'Example University'` wrapped | F3 | FAIL: `F3 the wrapped text` |
| Two words across a blank line | F4 | FAIL: `F4 nothing across a blank line` (exit 2); its control is F3 |
| `Universit\'e` | F5 | FAIL: `F5 a backslash` |
| `O'Brien` as one argument | F6 | FAIL: `F6 a single quote` |
| Inside an environment, in a `%` comment line | F7 inside an environment, F7 in a comment line | FAIL: each |
| A text a block holds twice | F8 | FAIL: `F8 two lines` |
| `--find 'sleep [GAP: citation needed]' --marker ...` | F9 | FAIL: `F9 the block and the occurrence` |
| `--find ''`, `--find '   '`, `--marker` alone, `--find` with `--print-blocks` | F10 an empty text, a blank text, --marker alone, --print-blocks | FAIL: each, stderr "unrecognized arguments" without the reason text |
| `--marker` the text does not hold | F11 | FAIL: `F11 a marker outside the text` |
| `SKILL.md`'s description at most 1,024 characters | by command | First read: 994. After: 1023 |
| `### edit`, each item of "What to build" 4 | by reading | First read: `grep -n "^### " skills/academic/paper/SKILL.md` lists no `### edit`; the section now stands at line 484, read item by item against "What to build" 4 |
| A copied page's text on the other modes unchanged | by reading the diff | First read: `grep -c "edit" skills/academic/paper/references/mode_selection_guide.md` printed 0. After: the diff of the five copied pages removes or rewrites only the lines the brief names (draft writer rules 3 and 5, the Claim check sentence, the resume bullet and the cited-sentence bullet of "The incremental check", the patch file sentence, the JSON example and the `kind` and one-op bullets of the protocol); each rewritten line keeps its old words on the other modes and adds `edit` or `fill_gap`. `intake_agent.md` and `mode_selection_guide.md` only gain lines |

Each rejection test asserts the problem text that names its reason (for example `occurrence must be a whole number from 1`, `is not one gap marker`, `fill_gap takes no new_text`, `kind replace_block is not allowed on block B0002`, `block B0003 is not named in the file of allowed blocks`, `is already named on line 1`, `--find needs a text that is not blank`), which the unchanged tree does not print. Every test runs the script on scratch files; none is an audit.

First run of `sh skills/academic/paper/templates/apply_tex_patch.test.sh` on the unchanged tree, whole:

```
G1 exit status {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G1 the output None
G1 the report names the op {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G2 exit status {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G2 only the second None
G3 exit status {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'", "OP002: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G3 both filled None
G4 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'", "OP002: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G5 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G6 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G7 0 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G7 -1 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G7 the string the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G7 true the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G8 not a gap marker the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G8 two gaps the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G9 the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G10 blank the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G10 a blank line the problem {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]}
G11 a cite command (2, {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]})
G11 a gap marker (2, {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]})
G12 exit 3 (2, {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]})
G13 applied with no flag (2, {'result': 'rejected', 'kind': 'validation', 'problems': ["OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'", "OP002: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'fill_gap'"]})
G13 the output
standard output is JSON ('', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l1.allowed-blocks\n')
L1 exit status and kind (2, {})
L1 the problem {}
standard output is JSON ('', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l2.allowed-blocks\n')
L2 exit status and kind (2, {})
L2 the problem {}
standard output is JSON ('', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l3.allowed-blocks\n')
L3 applied (2, {})
standard output is JSON ('', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l4.allowed-blocks\n')
L4 applied with no flag (2, {})
standard output is JSON ('', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l5.allowed-blocks\n')
L5 exit status and kind (2, {})
L5 the problem {}
L6 a block id alone (2, '', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l6a.allowed-blocks\n')
L6 an unknown kind (2, '', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l6b.allowed-blocks\n')
L6 a block on two lines (2, '', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l6c.allowed-blocks\n')
L6 an id the manifest does not hold (2, '', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/l6d.allowed-blocks\n')
L6 a path that does not exist (2, '', 'usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]\n                          [--check-only] [--acknowledge-structural]\n                          base patch\napply_tex_patch.py: error: unrecognized arguments: --allowed-blocks /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//apply-tex-patch-test.reIa2A/missing.allowed-blocks\n')
FAIL: apply_tex_patch.py does not hold the behaviour above
```

First run of `sh skills/academic/paper/templates/anchorize_tex.test.sh` on the unchanged tree, whole:

```
F1 exit status 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Author Name\n'
F1 the blocks ''
F2 exit status and output (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Third paragraph\n')
F3 the wrapped text (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Example University\n')
F4 nothing across a blank line (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Example University\n')
F5 a backslash (2, '', "usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Universit\\'e\n")
F6 a single quote (2, '', "usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find O'Brien\n")
F7 inside an environment (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Other cell\n')
F7 in a comment line (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Contact: J. Doe\n')
F8 two lines (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Example University\n')
F9 the block and the occurrence (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find sleep [GAP: citation needed] --marker [GAP: citation needed]\n')
F10 an empty text (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find \n')
F10 a blank text (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find    \n')
F10 --marker alone (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --marker [GAP: a]\n')
F10 --print-blocks (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find Intro\n')
F11 a marker outside the text (2, '', 'usage: anchorize_tex.py [-h] [--print-blocks] tex\nanchorize_tex.py: error: unrecognized arguments: --find improves with sleep --marker [GAP: citation needed]\n')
FAIL: anchorize_tex.py does not hold the behaviour above
```

Preserved behaviour, the base tests on base copies of the scripts (`git show HEAD:skills/academic/paper/templates/<file>` into the scratchpad, then `sh <scratch>/apply_tex_patch.test.sh 2>&1 | tail -1` and the same for `anchorize_tex.test.sh`):

```
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
```

The behaviours whose failure costs something, each with its case and a failing line of the first run (each quoted whole in the outputs above):

| Behaviour | Case | Failing line on the unchanged tree |
|---|---|---|
| `fill_gap` replaces only its marker | G1 | `G1 the output None` |
| `fill_gap` replaces only the occurrence it names | G2 | `G2 only the second None` |
| Several `fill_gap` ops on one block | G3 | `G3 both filled None` |
| Two ops on one occurrence rejected | G4 | `G4 the problem {...}` (long line, above) |
| `fill_gap` beside another kind rejected | G5 | `G5 the problem {...}` |
| `occurrence` bounds and type | G6, G7 | `G6 the problem {...}`, `G7 true the problem {...}` |
| `marker` form | G8 | `G8 two gaps the problem {...}` |
| No `new_text`, `answer` form | G9, G10 | `G9 the problem {...}`, `G10 a blank line the problem {...}` |
| `answer` spliced as written | G11 | `G11 a gap marker (2, {...})` |
| Heading check holds for `fill_gap` | G12 | `G12 exit 3 (2, {...})` |
| `fill_gap` outside the ratio | G13 | `G13 the output` |
| `--allowed-blocks` kind refused | L1 | `L1 the problem {}` |
| `--allowed-blocks` block refused, also under `--check-only` | L2, L5 | `L2 the problem {}`, `L5 the problem {}` |
| `--allowed-blocks` allowed ops applied, no ratio flag | L3, L4 | `L3 applied (2, {})`, `L4 applied with no flag (2, {})` |
| Malformed file of allowed blocks is a usage error | L6 | `L6 a block on two lines (2, '', 'usage: ...` (long line, above) |
| `--find` prints the blocks in order, writes nothing | F1, F2 | `F1 the blocks ''` |
| Whitespace rule and blank line | F3, F4 | `F3 the wrapped text (2, '', ...` (above) |
| Text read as written | F5, F6 | `F6 a single quote (2, '', ...` (above) |
| A block twice, an environment, a comment | F7, F8 | `F8 two lines (2, '', ...` (above) |
| `--marker` occurrence | F9 | `F9 the block and the occurrence (2, '', ...` (above) |
| Usage errors of `--find` and `--marker` | F10, F11 | `F10 --print-blocks (2, '', ...` (above) |

The lines marked "above" or `{...}` are named here by their start; their whole text is in the two first-run outputs.

## DONE / NOT DONE

| Item | State | Command and output as printed |
|---|---|---|
| 1. `apply_tex_patch.py`: `fill_gap`, `--allowed-blocks`, the docstring | DONE | `sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 \| tail -1` printed the PASS line below |
| 2. `anchorize_tex.py`: `--find`, `--marker`, the usage errors, the docstring | DONE | `sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 \| tail -1` printed the PASS line below |
| 3. The tests and their lines in `docs/dev/building.md` (lines 9, 10) and `docs/dev/scripts.md` (lines 9, 26, 27) | DONE | read in the diff; both PASS lines below |
| 4. `SKILL.md`: version 5.1.0, description, Quick start, the two tables, every listing line, Stops, Rules, `### edit` | DONE | description length `1023`; `git grep -n -i -c 'thirteen modes'` printed `skills/academic/paper/SKILL.md:4` |
| 5. The role and reference pages | DONE | read in the diff |
| 6. `README.md`, `building.md` line 41, glossary, `gen_figures.py` and the three SVGs, ADR 0062, ADR 0043's status line | DONE | the figure and grep checks below; `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| Verify 1, the two tests and the character-set check | DONE | below |
| Verify 2, the figures | DONE | below; a `shasum` of the SVGs of `docs/figures/academic/paper/` before and after a further run, compared with `diff`, printed nothing and exited 0 |
| Verify 3, the greps | DONE | below |
| Verify 4, the description length | DONE | `1023` |
| Verify 5, each test run on the unchanged tree and after | DONE | "The cases' first run" above and the PASS lines below |
| Verify 6, list items and sentence length | DONE | "Departures from the list and sentence rules" below |
| Verify 7, the grep of rule 14 | DONE | "The grep of rule 14" below |

The checks as printed, run from the worktree's root after the last change:

```
$ sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, writes nothing with --check-only, fills only the marker and occurrence a fill_gap op names, several on one block, rejects each malformed fill_gap op with its reason, confines a patch to the blocks and kinds --allowed-blocks names, and refuses a malformed file of allowed blocks as a usage error
$ sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, writes a manifest whose blocks and separators hold the whole file, and with --find prints each place a block holds a text, wrapped or not, with the marker's occurrence under --marker, writing nothing
$ <character-set check over the 20 changed files>
exit 0
$ python3 docs/figures/gen_figures.py (second run), then git status --short docs/figures
exit 0
 M docs/figures/academic/paper/lifecycle.svg
 M docs/figures/academic/paper/run-folder.svg
 M docs/figures/gen_figures.py
?? docs/figures/academic/paper/edit.svg
$ git ls-files -co --exclude-standard docs/figures/academic/paper
docs/figures/academic/paper/edit.svg
docs/figures/academic/paper/abstract-only.svg
docs/figures/academic/paper/citation-check.svg
docs/figures/academic/paper/disclosure.svg
docs/figures/academic/paper/format-convert.svg
docs/figures/academic/paper/full.svg
docs/figures/academic/paper/lifecycle.svg
docs/figures/academic/paper/lit-review.svg
docs/figures/academic/paper/outline-only.svg
docs/figures/academic/paper/plan.svg
docs/figures/academic/paper/rebuttal-audit.svg
docs/figures/academic/paper/response-letter.svg
docs/figures/academic/paper/revision-coach.svg
docs/figures/academic/paper/revision.svg
docs/figures/academic/paper/run-folder.svg
$ git grep -n -i 'twelve modes\|12 modes\|fourteen figures' -- skills README.md docs/dev docs/glossary.md
exit 1
$ git grep -n -i -c 'thirteen modes' -- skills/academic/paper/SKILL.md README.md docs/dev/building.md docs/dev/scripts.md
README.md:1
docs/dev/building.md:1
docs/dev/scripts.md:1
skills/academic/paper/SKILL.md:4
$ description length
1023
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ LC_ALL=C grep -n "[^ -~]" apply_tex_patch.py anchorize_tex.py gen_figures.py
exit 1
```

The character-set check line was `git status --short | awk '{print $2}' | grep -v '^\.scratch' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the rules file's expression>'` over the 20 changed files: it printed nothing, exit 0. `docs/figures/academic/paper` lists 15 files with `edit.svg` among them. The `git status --short docs/figures` lines are the first run's changes, the same after the second run. The last check, `LC_ALL=C grep` over the three Python files, printed nothing (exit 1 is grep's "no match").

## The grep of rule 14

`git grep -n -c -e '<name>' -- skills utils docs README.md` for each name the step adds or changes. Hits outside the step's paths, each read:

- `fill_gap`, `allowed-blocks`, `--find`, `paper edit`: `docs/roadmap.md` lines 26 and 27, entry 29's goal and gate, which describe what the step builds and stay true.
- `--find`: `skills/code/code-comments/SKILL.md` (`git diff --find-renames`), `skills/ordo/ordo-init/SKILL.md`, `templates/check_config.py` and its test: other commands' options of the same spelling, unrelated.
- `edit mode`: `docs/adr/README.md` line 71, the index row of ADR 0062 with its title, unchanged.
- `thirteen`: `docs/adr/0049-...md` line 22, "it adds a thirteenth mode against ADR 0043", the alternative 0049 rejected, which stays true; `skills/academic/researcher/SKILL.md` line 684, "the thirteen refusals", unrelated.
- `--marker`, `EDIT-REFUSED`, `G<n>`, `E<n>`, `fifteen figures`: no hit outside the step's paths.
- `git grep -n -i 'twelve\|eleven\b\|12 modes\|fourteen' -- skills utils docs README.md ':!docs/adr'` outside "twelve roles" and "twelve other": `docs/roadmap.md` 27 (the gate's own grep), 51 (another entry), `check_limits.test.sh` ("eleven pages"), an example of `paper-review-panel` ("Twelve positive cases"), `researcher/references/project_layout.md` 37: none counts `paper`'s modes.
- `git grep -l "response-letter"` outside `skills/academic/paper/` and `docs/adr`: `README.md`, the figures, `docs/glossary.md`, `docs/roadmap.md`, `skills/academic/researcher/references/handoff_schemas.md` line 648; none lists every mode of `paper` but the README's lifecycle text, rewritten.

Sentences about a changed file as a whole, reread after the change:

- `anchorize_tex.py` docstring line 2: "Build a block manifest for a LaTeX manuscript, or find the blocks that hold a text, without modifying it." (rewritten to hold with `--find`).
- `apply_tex_patch.py` docstring line 9: "A block no operation names cannot be silently rewritten, because no generation pass runs over it." Holds: a `fill_gap` op names its block.
- `SKILL.md` Steps: "The five scripts are run as ..." Holds: no script was added.
- `SKILL.md` Rules: "The project's manuscript folder holds only ... `<main>.pdf` beside the main `.tex` after a full, revision or edit run" (rewritten, since edit writes `<main>.pdf`).
- `SKILL.md` Agent prompts: "(12 total, matching the Agent Team table)" counts roles, unchanged.
- The two tests' head comments (line 2) list the new cases with the old ones, and their reason sentences now name the new cases' cost.

## Departures from the list and sentence rules

- `apply_tex_patch.py` docstring, the `validation` bullet: one sentence that enumerates every validation problem, as the existing bullet did; the list form of the docstring keeps one bullet per rejection kind.
- ADR 0062 Decisions 3 to 6: each decision stays one numbered item, as the ADR's form has it, so each holds several sentences.
- `SKILL.md` `### edit` item 1, the bullet on lines not read, and item 7, the bullet on the fresh agent: each holds a rule with its qualifiers, which "Lists and tables" keeps in one bullet.
- The glossary entry **edit mode** is one paragraph of six sentences, in the form of the other entries.
- `SKILL.md` description: one paragraph by the frontmatter rule.

## The terms

- **edit mode**: a new entry under "Ordo's own terms". Its "Stated in" names `skills/academic/paper/SKILL.md`, Steps, "edit": `grep -n "^### edit$" skills/academic/paper/SKILL.md` printed `484:### edit`; and ADR 0062, whose path `ls docs/adr/0062-*.md` printed.
- **incremental citation check**: changed to name the fresh agent of edit mode. Its "Stated in" gains `SKILL.md`, "edit" item 7: `grep -n "^7. When an applied op adds a cite command" skills/academic/paper/SKILL.md` printed `520:7. When an applied op adds a cite command, check those ops' citations.`; and `citation_compliance_agent.md`, "The incremental check": `grep -n "In edit mode no first check runs"` printed line 861.
- **case, of a skill's description**: used in the description's rewording ("without dropping a case it lists"): every case keeps a phrase.
- **refusal** and **stop** are used in `paper`'s own sense, as the skill already uses them in its Stops table.

## Files changed

From `git diff --numstat` (added, removed), run after the last change, and `wc -l` for the new SVG:

| File | Added | Removed |
|---|---|---|
| `README.md` | 2 | 2 |
| `docs/adr/0043-...md` | 1 | 1 |
| `docs/adr/0062-...md` | 7 | 7 |
| `docs/dev/building.md` | 3 | 3 |
| `docs/dev/scripts.md` | 3 | 3 |
| `docs/figures/academic/paper/edit.svg` | 90 (new) | 0 |
| `docs/figures/academic/paper/lifecycle.svg` | 24 | 17 |
| `docs/figures/academic/paper/run-folder.svg` | 12 | 11 |
| `docs/figures/gen_figures.py` | 52 | 5 |
| `docs/glossary.md` | 2 | 1 |
| `skills/academic/paper/SKILL.md` | 96 | 32 |
| `skills/academic/paper/agents/citation_compliance_agent.md` | 4 | 3 |
| `skills/academic/paper/agents/draft_writer_agent.md` | 22 | 2 |
| `skills/academic/paper/agents/intake_agent.md` | 1 | 0 |
| `skills/academic/paper/references/mode_selection_guide.md` | 21 | 0 |
| `skills/academic/paper/references/revision_patch_protocol.md` | 8 | 4 |
| `skills/academic/paper/templates/anchorize_tex.py` | 61 | 6 |
| `skills/academic/paper/templates/anchorize_tex.test.sh` | 77 | 2 |
| `skills/academic/paper/templates/apply_tex_patch.py` | 162 | 28 |
| `skills/academic/paper/templates/apply_tex_patch.test.sh` | 187 | 2 |
| `.scratch/29-paper-edit/agents/reviews/1-report.md` | this report | |


## Judgment calls the brief left open

- The description stays at 1,023 characters by these rewordings, no case dropped: "Every change to the manuscript is a patch" to "Every change is a patch"; "review the literature on a topic" to "review the literature"; "write an AI disclosure statement" to "write an AI disclosure". The two new phrases are "fill the gaps of my paper" and "change an author or affiliation".
- The whitespace rule of `--find`: a run of spaces and tabs holding at most one line break matches any such run, so no text is found across a blank line inside an environment either. The brief's item 2 reads "a run of spaces, tabs and line breaks", and Open item G (3) reads "single line breaks" with "a blank line still ending a block"; the script follows G (3).
- With `--marker`, the marker part of the text is matched exactly, so a marker wrapped across a line end in the `.tex` is not found. `apply_tex_patch.py` counts the marker exactly, so a wrapped marker could not be filled by a `fill_gap` op either; the item is then refused as found nowhere.
- The text of `--find` is stripped at both ends before the search, and a `--marker` that is empty is the usage error "the text of --find must hold the --marker once".
- `n_blocks_touched`, `blocks_untouched` and `block_touched_ratio` of the apply report count distinct blocks, so two `fill_gap` ops on one block count one block; with one op per block, as every earlier patch, the numbers are as before. Each `fill_gap` op's `chars_after` is the length of its own built block.
- The order of checks per op: an op on a block the file of allowed blocks does not name, or of a kind it does not allow, is reported before the duplicate-block check and the hash check.
- `SKILL.md` Steps 11: "Edit runs no reference fix, and names a `missing:` line in the final message", since ADR 0062 Decision 8 gives edit `cite-keys` and the compile fix only.
- `### edit` item 3 also prepares the `.bib`, with its last block allowed for `insert_after`, when an answer holds a cite command, so that the writer's `.bib` patch of item 8 has its manifest and its file of allowed blocks before the writer starts.
- `### edit` item 7 defines the blocks the run's patches changed, which item 7's `C<m>` patches and item 9's compile fix are confined to: in each file anchorized again after its patches, the blocks `--find` finds holding an answer of a `fill_gap` op or the new text of a change, and in the `.bib` the blocks after the block of the writer's `insert_after` op. It also starts one fresh citation compliance agent for the first patch with such ops and resumes it for each later one, one message per patch, as "The incremental check" does, and gives a `compile-fix` patch that adds a cite command the same check.
- `### edit` item 1 names the marker of a gap line as the text from `[GAP:` to the first `]` after it, and a gap line whose left side holds no marker or more than one is a line not read.
- The lifecycle figure gains the lane "/paper edit" between full and submit in the first row, with the part "Gaps answered and stated changes made, such as an author: before you submit or after".
- `SKILL.md` Steps 14 also names edit in the line on "Sources not read", since the fresh agent's report has that section.
- The figure `edit.svg` draws `--find`, the writer, the apply with its second patch, the session's questions, the fresh agent with its two stops, the compile and the final message; the stops drawn in every mode's note are not drawn.

## Host- or user-visible changes

- `apply_tex_patch.py`: before, `kind` was one of three and `--allowed-blocks` was an unknown argument (exit 2). After, `fill_gap` is a fourth kind whose block the script builds, and `--allowed-blocks <file>` confines a patch; a patch with no `fill_gap` op and no option behaves as before (P1 to P11).
- `anchorize_tex.py`: before, `--find` and `--marker` were unknown arguments (exit 2). After, `--find '<text>'` prints one block id per place and writes nothing, and `--marker` adds the occurrence.
- `/paper`: before, twelve modes and "Unknown mode" for `edit`. After, `/paper edit <main.tex> <edits file>` is the thirteenth mode, version 5.1.0.
- `README.md` line 57: "in twelve modes" to "in thirteen modes"; line 115 gains the lane "/paper edit".
- The figures `docs/figures/academic/paper/edit.svg` (new), `lifecycle.svg` (the edit lane) and `run-folder.svg` (the note names what edit runs).

## Anything in the brief that was wrong or impossible

- The brief's "What to build" 2 says "a run of spaces, tabs and line breaks", where Open item G (3), which the brief cites for it, says "single line breaks"; the script follows the ruling, as the judgment calls say. Nothing else in the brief was found wrong.
