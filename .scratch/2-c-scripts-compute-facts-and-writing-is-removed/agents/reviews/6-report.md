# Step 6 report: the tests of the kept scripts held to the rule

Everything in the brief is done. Two kept cases prove their cost only through their message line, because their fixture does not build the situation where the cost arises (pin.sh's not-a-worktree refusal, check_coverage.py's failing find); they are under "Cases kept on an assumption" and "Found in the brief's reach", since strengthening a fixture is outside this step.

## Open items of the state file, verbatim

- C (2026-09-29), step 5: the ASCII check of the verify list (`docs/dev/building.md`, the command blocks of both change standards, this state file) exits 0 when perl dies on a file it cannot decode, since its `END` block sets the exit status: a file holding the bytes `\377\376` made it print `Malformed UTF-8 character (fatal)` and exit 0. `.gitignore` does not ignore `__pycache__`, so a `python3` import leaves such a file in the check's reach. Options: (a) step 5 is widened to end both, the command keeping perl's own non-zero status when it dies and `__pycache__/` added to `.gitignore` (and to `repo-setup`'s `.gitignore` template if it has the same gap); (b) a new step after step 6 does it; (c) leave it. Recommendation (a): step 5 rewrites the rule that each verify command exits non-zero when it fails, and this command breaks that rule, so the fix belongs with it. The lazy option is (c); (b) only moves the same work later.

## The first run, on the unchanged tree

Run from the worktree root before any change, each under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, output to a file, then `tail -1` of it and the exit status:

```
utils/pin.test.sh exit 0 : PASS: pin.sh scratch tests
skills/ordo-init/templates/check_config.test.sh exit 0 : PASS: check_config.py scratch tests
skills/repo-setup/templates/sync_rules.test.sh exit 0 : PASS: sync_rules.py scratch tests
utils/check_coverage.test.sh exit 0 : PASS: check_coverage.py scratch tests
```

## How the cases were sorted

- A case is the group of assertions that proves one behaviour. Where a kept block also asserted a second behaviour whose failure costs nothing (a report line of an action already checked on disk, a summary line's format, stdout staying empty), that assertion group is removed as its own case and has its own row below. Every kept case keeps all its assertions.
- A message assertion stays in a kept case when it names which check refused, so that the case cannot pass on an unrelated refusal. A case whose revert leaves the script still refusing through another check, so that only its message line goes red, proves only its message and is removed, with the revert's output quoted as the evidence.
- The evidence for "refused anyway" comes from reverts run against the original test files at HEAD in scratch copies (column "Evidence"). The harness is `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/reverts.py`; it copies `skills/` and `utils/` to a fresh folder under `$TMPDIR`, applies one exact-text replacement to the script, runs the test there, and prints its exit status and last `FAIL:` line. In the quoted lines the scratch prefix `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/` is written `$TMPDIR/`; the lines under "Revert proofs, verbatim" are unedited.

## utils/pin.test.sh

### Removed

| Case (original lines) | What it proved | Why its failure costs nothing |
|---|---|---|
| Split-path watch: `split_prefixes`, `absent`, the final loop, and `[ -e "$test_root/my" ]` (46-65, 335, 540-547) | No path that a split of the HOME on its space would name was created | A split that misplaces links fails the kept readlink assertions under the same HOME; a stray empty folder from a split `mkdir` loses nothing |
| Nothing written into the folder the runs start from, with the default folders and at the end (334, 542) | pin.sh never creates entries in its working directory | Only a relative skill folder writes there, and that is the kept relative-folder refusal case, which keeps its own `ls -A "$work"` assertion |
| Summary line of the first pin and of check mode (123-125, 128-129), `pinned: v2` (150), the three-folder summary (466-467) | The summary names the tag and joins the folders with ", " | Output format nobody acts on; the links themselves are asserted by the kept readlink checks |
| "The removal is reported" lines (146-148, 162-164, 212-214) and "the replacement is reported" (179-180) | Pin mode prints a line for each link it removes or replaces | The removal and the replacement are asserted on disk by the kept cases; the printed line only reports them |
| Check mode names the live-clone link once (173-174) | No duplicate report line | Formatting of an error that is reported either way |
| Check mode passes after a repair, after the live-clone link is moved away, on the re-created worktree, after the `~/.agents/skills` removals, with ORDO_SKILL_DIRS set, with `~/.agents/skills` a link to `~/.claude/skills`, with the default folders, with the space-separated list, on a top-level pin (181-182, 215-216, 322-323, 377-378, 411-412, 439-440, 455-456, 468-469, 532-533) | Check mode raises no false alarm in each state | A false alarm loses nothing and installs nothing wrong; the kept control (check mode passes on a fresh pin) keeps the check-mode failure cases from passing against a check that always fails |
| A refused pin prints nothing on stdout (207) | stdout stays empty on the live-clone refusal | Output only; "nothing changes" is asserted on disk by the kept case |
| The second pin after the live-clone link is moved away removes `$d2/alpha` (209-211) | Re-pinning removes a stale link into the pinned worktree | Duplicate of the kept re-pin over a link to a skill the tag lacks; the fixture now removes `$d2/dev` and `$d2/alpha` by hand |
| A link that could not be removed is not reported as removed (231-242) | No false "removed" line when `rm` fails | The pin still exits non-zero through the check after linking (kept case). Evidence: with `rm "$link" || continue` changed to `rm "$link"` the test's only red is `FAIL: a link that could not be removed was reported as removed` |
| A link that could not be replaced is not reported as replaced (244-258) | No false "replaced" line when `ln` fails | Same as the row above: the check after linking fails the run, so only the line is wrong |
| The pinned worktree is clean after the refusals (288-289) | The test's own restore left no edit | Asserts the test's cleanup, not a behaviour of pin.sh |
| A real directory in a skill folder is refused (268-279) | The real-directory refusal and its message | Without that check the next check refuses the same entry: `readlink` of a directory prints nothing, so the entry counts as a link outside Ordo. Evidence: `FAIL: the real-directory refusal has no message; expected "pin: $TMPDIR/pin-test.ENnazz/my home/.claude/skills/beta is a real directory; move it away and run again" in: pin: $TMPDIR/pin-test.ENnazz/my home/.claude/skills/beta links to , outside Ordo; move it away and run again` |
| An unknown tag is refused (308-310) | The message `no tag v9` | Without the check, `git ls-tree` fails and the run still stops before any change. Evidence: `FAIL: the unknown-tag refusal has no message; expected "pin: no tag v9 in $TMPDIR/pin-test.bhxu2A/ordo" in: fatal: Not a valid object name v9` |
| An ORDO_SKILL_DIRS that names no folder is refused (471-479) | The message `names no folder` for a space, a newline, a tab | Without the check the empty entry is refused as not absolute. Evidence: `FAIL: the empty ORDO_SKILL_DIRS has no message; expected "pin: ORDO_SKILL_DIRS names no folder" in: pin: '' is not an absolute path` |
| A folder with leading spaces or a leading tab is refused with the whitespace message (the `"  $d1"` and `"$tab$d1"` values of the loop at 483) | The whitespace refusal for a leading blank | A path that starts with a blank is not absolute, so the absolute-path check refuses it. Evidence: `FAIL: the folder "  $TMPDIR/pin-test.DZWZjG/my home/.claude/skills" (newline form) was not refused with its message; expected "pin: '  .../skills' has leading or trailing whitespace" in: pin: '  .../skills' is not an absolute path`. The trailing-space value stays: nothing else refuses it |
| Check mode refuses a padded folder (509-513) | The same validation in check mode | The folder list is validated once, before the mode is chosen (`utils/pin.sh` lines 77-85), so this is the kept refusal case run again |
| A link in `~/.agents/skills` that could not be removed (391-399) | Pin mode fails and prints no "removed" line | Duplicate: the failure comes from the check after linking (kept case) reading that folder (kept check-mode case); the line is output only |
| Check mode names no kept entry of `~/.agents/skills`, and no line names the folder with ORDO_SKILL_DIRS set or a folder of the list (374-376, 387-389, 408-410, 423-425, 435-437) | No output line about entries that are kept | Output only; the kept entries are asserted on disk |
| `CLAUDE_CONFIG_DIR=$HOME/.agents`: `~/.agents/skills` is then a folder of the list and its link is replaced, not removed (415-427) | The folder is compared with the list by its path | Duplicate. The folder exists there, so the resolved-path comparison already matches it: removing the path comparison leaves the original test green (`H pin CLAUDE_CONFIG_DIR=~/.agents, path comparison only | exit 0 | PASS: pin.sh scratch tests`), and removing both comparisons turns the kept resolved-path case red (`FAIL: pinning with $TMPDIR/pin-test.Ox8Wf1/my home/.agents/skills a link to $TMPDIR/pin-test.Ox8Wf1/my home/.claude/skills failed: pin: removed $TMPDIR/pin-test.Ox8Wf1/my home/.agents/skills/beta, in a folder pin.sh no longer links into`). The CLAUDE_CONFIG_DIR folder being linked is the kept CLAUDE_CONFIG_DIR case |

### Kept, with the cost its failure carries

- Check mode fails with no pinned worktree: a check that passes with nothing installed.
- The first pin links every skill of the tag in both folders: skills not linked, a broken installation.
- The pinned worktree stays where it is when the live clone moves on: installed skills that change with every edit of the live clone.
- A move to a tag that drops a skill and adds one: the dropped skill's link left dangling, the added one not linked.
- Check mode fails naming a link to a skill the tag lacks, and a re-pin removes that link: a check that passes a dangling link, and a pin that leaves it.
- Check mode fails naming a link into the live clone, and pin mode replaces it: an installation that runs the live clone's skills.
- Pin mode refuses a live-clone link for a skill the tag lacks before the worktree or any link changes: without the refusal the pin moves the worktree and relinks, then fails, leaving a half-moved installation.
- The check after linking fails when a link could not be made: a pin that reports success on a broken installation.
- Pin mode refuses a pinned worktree with local changes: the installed skills would carry edits the tag does not hold.
- Pin mode refuses a link to a folder outside Ordo: the user's own link replaced and lost.
- A pinned worktree deleted by hand is created again, and another missing worktree keeps its registration: no installation after a manual delete, or another worktree's registration pruned.
- The default folders are `~/.claude/skills` only (and `$CLAUDE_CONFIG_DIR/skills`): skills linked into a folder the pin does not own.
- In `~/.agents/skills`, a link to a folder outside Ordo and a real folder are kept: the user's link or folder destroyed.
- With ORDO_SKILL_DIRS set, `~/.agents/skills` is left alone: a link removed from a folder the user did not give the pin.
- `~/.agents/skills` as a link to `~/.claude/skills` is a folder of the list: the pin would remove every link it just made.
- The `$CLAUDE_CONFIG_DIR/skills` folder is linked, and check mode fails on a missing link there: skills not linked in the configured folder, and a check that passes it.
- ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs: folders not linked.
- A relative folder and a folder ending in a space are refused before anything changes: skills linked into the wrong folder while the named one gets none.
- A top-level tag pins and the move back to a `skills/` tag works: tag v1.0.0 of this repository is top-level (`git ls-tree` over each tag), so a rollback to it would install nothing.
- Harness guard in `run_pin`, not a case: a run whose summary line names a folder outside the two scratch roots fails the test, which protects the user's real skill folders from the test itself.

### Cases kept on an assumption

- Check mode passes on a fresh pin. Assumption: a false alarm of check mode costs something. It is also the control that keeps every check-mode failure case from passing against a check that always fails.
- A pinned worktree path that is not a git worktree is refused. Assumption: `$ORDO_STABLE` can name a folder inside another git repository, where `git -C "$stable" checkout` would move that repository. The fixture's folder is inside no repository, so the revert turns the case red only through its message line (the pin still stops when `git checkout` fails); see "Found in the brief's reach".
- The removals from `~/.agents/skills` (a link into the pinned worktree, into the live clone, through a linked parent folder, to the worktree's root) and check mode failing on such a link. Assumption: a harness the user runs reads `~/.agents/skills`, so a link left there installs a skill wrongly.

## skills/ordo-init/templates/check_config.test.sh

### Removed

| Case | What it proved | Why its failure costs nothing |
|---|---|---|
| unknown-launch_note, unknown-worker_allow, unknown-worker_effort | These three keys are not in the plan skill's `templates/plan.yaml` | The unknown-key mechanism is the kept case unknown-key; these guard the template's content, and a key the template holds is by definition a valid one. Evidence: with `launch_note` added to the template the case goes red with `got a pass: ok: ...`, which is then the correct result |
| libraries-missing | `templates/plan.yaml` marks libraries required | Same mechanism as the kept missing-key; it guards the template's marker. Evidence: marking it optional gives `note: libraries not set, default 'check' applies`, a valid configuration under that template |
| libraries-capital (`Check`) | A capitalised value is refused | Same code line and same path as libraries-maybe (`check_config.py` line 72) |
| libraries-empty-string (`''`) | An empty string is refused | Duplicate of libraries-empty: every revert that accepts `''` (skipping falsy values) also accepts `None`, which the kept case catches |
| libraries-check (pass) | `libraries: check` passes | The complete configuration already holds `libraries: check` (`skills/plan/templates/plan.yaml` line 13) |
| projects-libraries | In the projects: form the project lacking libraries is named and the other is not | The per-project required-key check with its project label is the kept projects case (`tool-a: required key missing: worker`); the "other project not named" half is a false report, which loses nothing |
| projects-libraries-value | The value check runs per project, with its label | `check_project` runs every check per project (`check_config.py` line 96), shown by the kept projects case; the value check itself is the kept libraries-maybe |

### Kept, with the cost its failure carries

Each is "a wrong configuration accepted", which every plan skill then reads:

- missing-key (`reviewer` absent).
- unknown-key (`reviewers`, a misspelt key whose real key then silently defaults).
- missing-page (`verification` names no file).
- not-ignored (the worktree root not ignored, so worktrees are committable).
- config-ignored (`.agents/plan.yaml` ignored, so the configuration is never tracked).
- bad-harness (`worker: opus`).
- codex-worker (`worker: codex:...`).
- bad-type (`repair_rounds: one`).
- projects, missing worker in the projects: form, named with its project.
- libraries-maybe, libraries-boolean (`yes`, read by YAML as `True`), libraries-empty (`libraries:` with no value).

### Cases kept on an assumption

- complete (the one-project example passes), projects (the several-projects example passes), agents-star (`.agents/*` with `!.agents/plan.yaml` passes), libraries-avoid. Assumption: refusing a valid configuration costs something, because `ordo-init`'s setup "is done only when that exits 0" (`skills/ordo-init/SKILL.md` Steps 13) and its check mode proposes a fix for each error; agents-star is the ignore rule `ordo-init` itself drafts (Steps 9). complete and projects are also the controls of the refusal cases, and agents-star is the near-miss control of config-ignored.

## skills/repo-setup/templates/sync_rules.test.sh

### Removed

| Case | What it proved | Why its failure costs nothing |
|---|---|---|
| same | An equal block exits 0 and prints `ok:` | Duplicate: the kept drift case runs the check again after `--write` and expects exit 0 on the equal block |
| same-crlf | An equal block in a CRLF file exits 0 | Failure reports an equal block as drifted; `--write` would then write the template, nothing lost. Evidence: `exit 1, expected 0` |
| mixed (CRLF on every line but the first) | The block takes the ending most lines use | Line-ending choice of the block only; the bytes outside the block are proven kept by the drift and crlf cases |
| tie-crlf, tie-lf | On a tie the block takes the first line's ending | Line-ending choice of the block only |
| no-block | A CLAUDE.md with no markers is refused with exit 2 | Without the check the script stops with a traceback, exit 1, before any write. Evidence: `exit 1, expected 2: [] [Traceback (most recent call last):` |
| two-ends | A second end marker is refused | The block runs to the first end marker and the text after it is outside the block and kept; nothing is lost and no drifted block is reported equal. Evidence: `exit 0, expected 2: [ok: the shared-rules block equals the template] []` |
| no-claude | A missing CLAUDE.md is refused with its own message | The read then fails with `error: cannot read .../CLAUDE.md: No such file or directory`, exit 2 |
| not-utf8 (CLAUDE.md) | A non-UTF-8 CLAUDE.md is refused with exit 2 | Without the handler the script stops with a traceback before any write. Evidence: `exit 1, expected 2: [] [Traceback (most recent call last):` |
| no-template, shared-rules.md in CRLF, shared-rules.md not UTF-8 | The template's own read errors and its CRLF form | A missing or unreadable template stops the script before any write (evidence: `exit 1, expected 2 ... cannot read .../shared-rules.md`); a CRLF template not normalised reports a drift, exit 1, and loses nothing |
| read-only | A CLAUDE.md `--write` cannot open is refused with exit 2 | The open for writing fails before the file is truncated, so the script stops with a traceback and the file is unchanged. Evidence: `exit 1, expected 2: [] [Traceback (most recent call last):` |

### Kept, with the cost its failure carries

- drift, in an LF file under a preamble with a tab, trailing spaces and a UTF-8 letter: the check exits 1 with the drifted line in its diff, `--write` makes the block equal, and every byte outside the block is kept. Failure reports a drifted block as equal, or rewrites the user's text outside the block.
- crlf: the same in a CRLF file, the block written in CRLF and every byte outside it kept. Failure rewrites the user's line endings outside the block.
- reversed markers refused: without the refusal `--write` writes `text[:start] + template + text[stop:]` with `stop` before `start`, duplicating the user's text between the markers.
- two-begins refused: without the refusal `--write` replaces everything from the first begin marker, including any user text between the two.
- two-blocks refused: without the refusal a drifted second block is reported equal (`exit 0 ... ok:`).
- lost-write refused: a write that did not take reported as written, the user's repair silently not written.

### Cases kept on an assumption

None.

## utils/check_coverage.test.sh

The real run (`docs/academic-coverage.md` line 27) covers four real folders of `research-hub/.agents/skills` (`ls -la`: directories, not links), 169 files (`find ... -type f | wc -l`), with hidden `.gitkeep` files, nested paths, no links and no name outside ASCII (a `find` over the four folders printed no link and no non-ASCII name).

### Removed

| Case | What it proved | Why its failure costs nothing |
|---|---|---|
| repeated-skill | A skill given twice prints its errors once | Output format; the list is refused either way |
| lettered, lettered-dotted | `## 2.A` is an entry; `## 6.B.` is not | A false refusal in one case; in the other an entry whose heading exists accepted. Neither leaves a file uncovered |
| done-lettered | `- [x] 4.C.` and `- [x] 7.D` are entries | False refusal only |
| roadmap-separators | U+2028 and U+0085 inside a roadmap line start no line | No user reaches it: the ASCII check refuses those characters in every tracked file, `docs/roadmap.md` included |
| escaped-last-cell | A last cell ending in `\|` keeps its pipe | Changes which entry text is compared; no file is left uncovered |
| separator-names, newline-name, nfc-names | Names holding U+2028, U+0085, a newline, or composed and decomposed accents | No such name in the four real folders; a newline split still refuses the list |
| order | Errors sorted by line, then message | Output format |
| empty-table | A header-only table reports every file not listed | Duplicate of the kept missing-hidden (same line, `check_coverage.py` 268-270) |
| empty-folder | An empty folder with an empty table passes | False refusal only |
| backtick-info, fenced-rows, closing-hashes, long-fence | Fence and heading parsing that lets a correct list pass | False refusal only |
| fenced-heading | A fenced `## beta` is not a section | Read as a section it would appear twice or hold no table, so the list is still refused |
| unclosed-fence | An unclosed fence is an error | Everything after the fence is unread, so a named section after it is reported missing; only text that is no named section is swallowed. Evidence: the test's fence swallows a duplicate `## alpha` and the reverted check prints `ok` on a list that is complete |
| linked-empty, linked-listed | A skill folder that is a link is read through the link | Without `find -H` the folder itself is reported as a link and the list is refused. Evidence: `FAIL: linked-empty: missing [:0: 'linked/SKILL.md' is not listed] in: .../linked-empty.md:0: 'linked/.' is a link; its target is not listed or read` |
| gamma-named, and the unread malformed gamma section | Sections of folders not named are not read | False refusal only |
| missing-nested | A nested file missing from the list is reported | Duplicate: the generic revert (unlisted files not reported) reddens the kept missing-hidden, and the nested revert (`-maxdepth 1`) reddens the complete control (`complete.md:18: 'references/deep/guide.md' is not a file of alpha`) |
| not-a-file | A row naming no file is reported | Duplicate of the first assertion of the kept wrong-section |
| dotdot, absolute, not-normal | A path that is not plain is reported | Such a path is never a file on disk, so the row is "not a file" and the real file stays unlisted. Evidence: `missing [:23: '../alpha/.gitkeep' is not a plain path ...] in: .../dotdot.md:0: 'alpha/.gitkeep' is not listed` |
| no-backticks | A file cell without backticks is reported | The file stays unlisted and is reported |
| mark-no-space, drop-with-skill, dropped | Three further malformed marks | Same line as the kept unknown-mark (`check_coverage.py` 262) |
| unknown-skill-later | `rebuild later:` naming an unknown skill | Same line as the kept unknown-skill (264) |
| two-cells, four-cells | A row with the wrong cell count | Without the check the script stops with a traceback, exit 1. Evidence: `missing [:23: a row of 'alpha' has 2 cells, not 3] in: Traceback (most recent call last):` |
| wrong-header | A header other than File, Mark, Reason | A list with every file, mark and reason is complete whatever its header says |
| no-separator | A table without a separator row | The first data row is then taken as the separator and its file reported unlisted. Evidence: `in: .../no-separator.md:0: 'alpha/SKILL.md' is not listed` |
| row-after-table, row-after-blank | A table row after the table's end | The stray row is ignored and every file is still checked. Evidence: the reverted check prints `ok` on a complete list |
| indented-table, no-table | A section with no table | Every file of the section is then reported unlisted. Evidence: `in: .../indented-table.md:0: 'alpha/.gitkeep' is not listed` |
| new-skills-twice | A second `## New skills` section | Its rows are ignored, so a mark naming a skill only there is reported |
| entry-malformed | `5x` is not an entry | Same line as the kept entry-missing (230) |
| skill-twice | A skill named twice in New skills | Each mark still names a skill with a roadmap entry; no file is left uncovered |
| empty-entry, empty-skill | An empty cell in New skills | An empty entry is then reported as not in the roadmap (`:11: roadmap entry '' of 'layout' is not in docs/roadmap.md`); an empty skill name is named by no mark |
| no-new-skills | A list without New skills | Every rebuild mark is then reported (`:21: the mark names 'paper', which is not a row of New skills`) |
| unknown-option (first, last, alone) | An argument starting with `-` is refused with its message | Every position is still refused with exit 2 by another usage check. Evidence: `unknown-option: got: usage error: .../complete.md: not a folder` |
| usage-missing-root, usage-missing-folder | A missing root or skill folder is exit 2 with its message | Still exit 2 through the next check (`usage error: .../nosuch/alpha: not a folder`, `usage error: .../delta: find failed: ...`) |
| usage-missing-list, usage-missing-roadmap, latin1 | An unreadable list or roadmap is exit 2 | Without the handler the script stops with a traceback, exit 1, and accepts nothing |
| outside-repo | A list outside a git repository is exit 2 | No user reaches it: the list is `docs/academic-coverage.md` in this repository |

### Kept, with the cost its failure carries

Each is "a coverage list accepted that misses a file or gives a file no decision", whose content is then lost when the academic skills are removed at roadmap entry 16:

- missing-hidden: a file absent from the list.
- listed-twice: a file listed twice, possibly with two different marks.
- wrong-section: a file of beta listed only in alpha's section is not counted as listed for beta.
- unknown-mark: a file with no valid decision.
- unknown-skill: a file marked for a skill no roadmap entry builds.
- empty-reason: a file with no reason.
- no-section: a named skill with no section, whose files are then never checked.
- section-twice: a skill's second section, possibly with other marks, silently ignored.
- entry-missing: a new skill whose roadmap entry does not exist.
- Harness guard in `direct`, not a case: a run that changes anything under the scratch folder fails the test.

### Cases kept on an assumption

- complete. Assumption: a false refusal of a correct list costs something. It is also the control of every refusal case, and it catches the hidden-file, nested-file and per-section reverts (see the revert table).
- nested-link. Assumption: a link appears inside a covered skill folder; the four real folders hold none.
- usage-no-skill. Assumption: the check is run without the skill names; the documented command names all four.
- find-fails. Assumption: a covered folder holds a subfolder `find` cannot read. The fixture's list has no section for the locked folder, so the revert turns the case red by its exit status (1 instead of 2) rather than by accepting a list; see "Found in the brief's reach".

## Revert proofs

Every kept case, the revert that turns it red, and the red line. Run against the final tests with `python3 .../scratchpad/reverts.py`; each revert is one exact-text replacement in the script in a scratch copy under `$TMPDIR`.

| Case | Revert | Red line |
|---|---|---|
| cc complete | the type check no longer skips required keys | `FAIL: complete: expected a pass, got: error: roadmap is a str, its default is a NoneType: 'docs/roadmap.md'` |
| cc missing-key | the required-key error dropped | `FAIL: missing-key: expected an error, got a pass: ok: ...` |
| cc unknown-key | the unknown-key error dropped | `FAIL: unknown-key: expected an error, got a pass: ok: ...` |
| cc missing-page | the page error dropped | `FAIL: missing-page: expected an error, got a pass: ok: ...` |
| cc not-ignored | the worktree-root error dropped | `FAIL: not-ignored: expected an error, got a pass: ok: ...` |
| cc config-ignored | the ignored-configuration error dropped | `FAIL: config-ignored: expected an error, got a pass: ok: ...` |
| cc agents-star | the probe tests `.agents/probe` instead of `.agents/plan.yaml` | `FAIL: agents-star: expected a pass, got: error: .agents/plan.yaml is ignored by git` |
| cc bad-harness | `MODEL` becomes `^(claude:)?\S+$` | `FAIL: bad-harness: expected an error, got a pass: ok: ...` |
| cc codex-worker | `MODEL` becomes `^\w+:\S+$` | `FAIL: codex-worker: expected an error, got a pass: ok: ...` |
| cc bad-type | the type error dropped | `FAIL: bad-type: expected an error, got a pass: ok: ...` |
| cc projects (pass) | `set(config) != {"projects"}` becomes `!= set()` | `FAIL: projects: expected a pass, got: error: keys beside projects: []` |
| cc projects, missing worker | the per-project `check_project` call dropped | `FAIL: projects: expected an error, got a pass: ok: ...` |
| cc libraries-maybe | the libraries value error dropped | `FAIL: libraries-maybe: expected an error, got a pass: ok: ...` |
| cc libraries-boolean | the value check skips values that are not strings | `FAIL: libraries-boolean: expected an error, got a pass: ok: ...` |
| cc libraries-empty | the value check skips `None`, as the review check does | `FAIL: libraries-empty: expected an error, got a pass: ok: ...` |
| cc libraries-avoid | the accepted values become `("check",)` | `FAIL: libraries-avoid: expected a pass, got: error: libraries is neither check nor avoid: 'avoid'` |
| sr drift (detected) | the block is compared by its first line only | `FAIL: python3 -B .../sync_rules.py .../drift: exit 0, expected 1: [ok: the shared-rules block equals the template] []` |
| sr drift (outside bytes) | `--write` writes from the begin marker, dropping the text before it | `FAIL: --write changed bytes outside the block` |
| sr crlf | `read()` opens without `newline=""` | `FAIL: --write left 0 CRLF lines of 55` |
| sr reversed | the marker-order condition dropped | `FAIL: ... reversed: exit 1, expected 2: [--- CLAUDE.md (shared rules)` |
| sr two-begins | the begin-marker count dropped | `FAIL: ... two-begins: exit 1, expected 2: [--- CLAUDE.md (shared rules)` |
| sr two-blocks | the counts become `text.count(BEGIN) != text.count(END)` | `FAIL: ... two-blocks: exit 0, expected 2: [ok: the shared-rules block equals the template] []` |
| sr lost-write | the read-back comparison dropped | `FAIL: ... lost-write --write: exit 0, expected 2: [written: the shared-rules block now equals the template] []` |
| pin no worktree | the `[ -d "$stable" ]` refusal of check mode dropped | `FAIL: check mode passed with no pinned worktree` |
| pin first pin | links made into the live clone instead of the pinned worktree | `FAIL: first pin failed:  pin: $TMPDIR/pin-test.0SDdW5/my home/.claude/skills/alpha links to $TMPDIR/pin-test.0SDdW5/ordo/skills/alpha, in the live clone ...` |
| pin live clone moves | the pinned worktree made a link to the live clone | `FAIL: $TMPDIR/pin-test.EKjKxS/my home/.claude/skills/alpha does not link into the pin` |
| pin dropped skill | the `rm` of a link the tag no longer holds dropped | `FAIL: second pin failed:  pin: .../.claude/skills/alpha links to .../ordo-stable/skills/alpha, which the pinned tag does not have` |
| pin check: skill the tag lacks | that branch of `check_links` dropped | `FAIL: check mode passed with a link to a skill the tag lacks` |
| pin check: live clone link | that branch of `check_links` dropped | `FAIL: check mode passed with a link into the live clone` |
| pin live-clone link replaced | a link into the live clone is skipped when linking | `FAIL: re-pinning did not repair the link:  pin: .../.claude/skills/beta links to .../ordo/skills/beta, in the live clone ...` |
| pin live-clone link refused | the `tag_holds` refusal dropped | `FAIL: pin mode did not refuse the link into the live clone; expected "pin: .../dev links into the live clone ...; move it away or pin a tag that holds it" in: pin: .../dev links to .../ordo/skills/dev, in the live clone ...` |
| pin check after linking | the final `check_links || fail` made `|| :` | `FAIL: pin mode passed with a link it could not make` |
| pin local changes | the local-changes refusal dropped | `FAIL: pinned over a worktree with local changes` |
| pin foreign link | the outside-Ordo refusal dropped | `FAIL: replaced a link to a folder outside Ordo` |
| pin not a worktree | the toplevel refusal dropped | `FAIL: the not-a-worktree refusal has no message; expected "pin: $TMPDIR/pin-test.C8G6kr/my home/plain exists and is not a git worktree" in: fatal: not a git repository (or any of the parent directories): .git` |
| pin deleted by hand | `--force` dropped from `git worktree add` | `FAIL: pinning after the worktree was deleted by hand failed:  fatal: '.../ordo-stable' is a missing but already registered worktree;` |
| pin other registration | `git worktree prune` run before `git worktree add` | `FAIL: pinning dropped the registration of another missing worktree` |
| pin defaults | the defaults include `~/.agents/skills` | `FAIL: pin.sh wrote into $TMPDIR/pin-test.zdoo8h/my home/.agents/skills with the default folders` |
| pin `~/.agents/skills` land | the removal in that folder dropped | `FAIL: pinning with links in .../.agents/skills failed:  pin: .../.agents/skills/gamma links to .../ordo/skills/gamma, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it` |
| pin `~/.agents/skills` gamma | `$repo` dropped from both comparisons of `links_into_ordo` | `FAIL: the link into the live clone in $TMPDIR/pin-test.oA25lJ/my home/.agents/skills was not removed` |
| pin `~/.agents/skills` plan | the resolved-path comparison of `links_into_ordo` dropped | `FAIL: the link into the pinned worktree through a linked folder was not removed` |
| pin `~/.agents/skills` stable-root | the bare `"$stable"` and `"$repo"` patterns dropped | `FAIL: the link to the pinned worktree's root was not removed` |
| pin `~/.agents/skills` other kept | the `links_into_ordo` filter dropped | `FAIL: the link to a folder outside Ordo in $TMPDIR/pin-test.2XlGBY/my home/.agents/skills was changed` |
| pin `~/.agents/skills` find-skills kept | an entry that is not a link removed with `rm -rf` | `FAIL: the real folder in $TMPDIR/pin-test.iWOElD/my home/.agents/skills was changed` |
| pin check reads `~/.agents/skills` | that loop of `check_links` dropped | `FAIL: check mode did not fail on a link in $TMPDIR/pin-test.ZehQLc/my home/.agents/skills (exit 0)` |
| pin ORDO_SKILL_DIRS set | `outside_dir` ignores ORDO_SKILL_DIRS | `FAIL: the link in $TMPDIR/pin-test.8DN02C/my home/.agents/skills was removed with ORDO_SKILL_DIRS set` |
| pin resolved path | the resolved-path comparison of `outside_dir` dropped | `FAIL: pinning with .../.agents/skills a link to .../.claude/skills failed: pin: removed .../.agents/skills/beta, in a folder pin.sh no longer links into` |
| pin CLAUDE_CONFIG_DIR | `$CLAUDE_CONFIG_DIR/skills` not added to the list | `FAIL: the CLAUDE_CONFIG_DIR folder was not linked` |
| pin split on tabs | `tr ' \t' '\n\n'` becomes `tr ' ' '\n'` | `FAIL: /private/tmp/pin-plain.OoFszP/b/beta not linked from the space-separated list` |
| pin relative folder | the not-absolute refusal dropped | `FAIL: pin.sh linked into rel/skills, outside the scratch roots` |
| pin trailing whitespace | the whitespace refusal dropped | `FAIL: pinned with the folder "$TMPDIR/pin-test.CrCFrg/my home/.claude/skills " (newline form)` |
| pin top-level tag | the top-level fallback for `tag_skills` dropped | `FAIL: a top-level tag did not pin:  pin: tag v0 holds no skill` |
| cov complete | `\|` no longer read as a pipe inside a cell | `FAIL: complete: expected exit 0, got 1: .../complete.md:0: 'alpha/SKILL.md' is not listed` |
| cov nested-link | the link error dropped | `FAIL: nested-link: expected exit 1, got 0: ok: .../nested-link.md` |
| cov missing-hidden | the "is not listed" error dropped | `FAIL: missing-hidden: expected exit 1, got 0: ok: .../missing-hidden.md` |
| cov complete, hidden files | `find` skips names starting with `.` | `FAIL: complete: expected exit 0, got 1: .../complete.md:19: '.gitkeep' is not a file of alpha` |
| cov complete, nested files | `find -maxdepth 1` | `FAIL: complete: expected exit 0, got 1: .../complete.md:18: 'references/deep/guide.md' is not a file of alpha` |
| cov listed-twice | the duplicate check dropped | `FAIL: listed-twice: expected exit 1, got 0: ok: .../listed-twice.md` |
| cov wrong-section, first assertion | the "not a file" error dropped | `FAIL: wrong-section: missing [:20: 'template.tex' is not a file of alpha] in: .../wrong-section.md:0: 'beta/template.tex' is not listed` |
| cov wrong-section, second assertion | a file counts as listed when any section lists its path | `FAIL: wrong-section: missing [:0: 'beta/template.tex' is not listed] in: .../wrong-section.md:20: 'template.tex' is not a file of alpha` |
| cov complete, per section | one `seen` shared by all sections | `FAIL: complete: expected exit 0, got 1: .../complete.md:25: 'SKILL.md' is listed twice in 'beta' (first at line 17)` |
| cov unknown-mark | the mark check dropped | `FAIL: unknown-mark: expected exit 1, got 0: ok: .../unknown-mark.md` |
| cov unknown-skill | the New skills membership check dropped | `FAIL: unknown-skill: expected exit 1, got 0: ok: .../unknown-skill.md` |
| cov empty-reason | the reason check dropped | `FAIL: empty-reason: expected exit 1, got 0: ok: .../empty-reason.md` |
| cov no-section | the no-section error dropped | `FAIL: no-section: expected exit 1, got 0: ok: .../no-section.md` |
| cov section-twice | the appears-twice error for a skill dropped | `FAIL: section-twice: expected exit 1, got 0: ok: .../section-twice.md` |
| cov entry-missing | the roadmap entry check dropped | `FAIL: entry-missing: expected exit 1, got 0: ok: .../entry-missing.md` |
| cov usage-no-skill | `len(argv) < 3` becomes `< 2` | `FAIL: usage-no-skill: expected exit 2, got 0: ok: .../usage-no-skill.md` |
| cov find-fails | the `find` return-code check dropped | `FAIL: find-fails: expected exit 2, got 1: .../complete.md:0: no '## locked' section` |

### Revert proofs, verbatim

One or more per file, unedited lines of `$TMPDIR/reverts-final.txt`:

```
cc missing-key | exit 1 | FAIL: missing-key: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
sr crlf | exit 1 | FAIL: --write left 0 CRLF lines of 55
pin C8 check after linking | exit 1 | FAIL: pin mode passed with a link it could not make
pin C9 local changes | exit 1 | FAIL: pinned over a worktree with local changes
cov missing-hidden (unlisted file not reported) | exit 1 | FAIL: missing-hidden: expected exit 1, got 0: ok: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.wxal2R/repo/docs/missing-hidden.md
cov usage-no-skill | exit 1 | FAIL: usage-no-skill: expected exit 2, got 0: ok: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.MoqWtY/repo/docs/usage-no-skill.md
```

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| First run on the unchanged tree | DONE | Quoted under "The first run" |
| Cases sorted, the costless removed, the kept unchanged | DONE | The tables above; `git diff --stat`: `4 files changed, 46 insertions(+), 667 deletions(-)` |
| Fixtures used only by removed cases removed | DONE | pin: `split_prefixes` and `absent`; sync_rules: the `chmod` of the trap (only the read-only case locked a file); check_coverage: the folders `gamma`, `empty`, `sep`, `nl`, `nfd`, the link `linked`, the roadmap lines for 2.A, 6.B, 4.C, 7.D, 30 to 33, and the fenced `## beta` and the `## gamma` section of `base.md`; check_config: none |
| Head comments rewritten, one paragraph per line | DONE | Lines 2-9 of `utils/pin.test.sh`, 2-4 of `check_config.test.sh`, 2-4 of `sync_rules.test.sh`, 2-5 of `check_coverage.test.sh`; each statement there has a kept case |
| No script changed, no case added | DONE | `git status --short` lists only the four test files: ` M skills/ordo-init/templates/check_config.test.sh`, ` M skills/repo-setup/templates/sync_rules.test.sh`, ` M utils/check_coverage.test.sh`, ` M utils/pin.test.sh` |
| Each test prints PASS and exits 0 after | DONE | `utils/pin.test.sh` (under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`): `PASS: pin.sh scratch tests`, `exit 0`; `check_config.test.sh`: `PASS: check_config.py scratch tests`, `exit 0`; `sync_rules.test.sh`: `PASS: sync_rules.py scratch tests`, `exit 0`; `check_coverage.test.sh`: `PASS: check_coverage.py scratch tests`, `exit 0` |
| Revert per kept case, run in scratch copies, FAIL quoted | DONE | "Revert proofs" above: every kept case red under its revert, exit 1 |
| Verify list through the land skill's runner | DONE | Output below |
| ASCII and dash asides in the four files | DONE | `LC_ALL=C grep -n '[^ -~]'` over the four files printed nothing; a grep for ` - ` and ` -- ` in their comment lines printed nothing |

`sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`, run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, printed, then `exit 0`:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
checks: 7 commands passed
```

## Line counts (`wc -l`)

| File | Before | After |
|---|---|---|
| `utils/pin.test.sh` | 548 | 363 |
| `skills/ordo-init/templates/check_config.test.sh` | 159 | 126 |
| `skills/repo-setup/templates/sync_rules.test.sh` | 272 | 168 |
| `utils/check_coverage.test.sh` | 486 | 187 |

## Doc text

No line elsewhere is made false. Each line that names what one of these tests proves was reread (`git grep -n -e 'pin.test' -e 'sync_rules.test' -e 'check_config.test' -e 'check_coverage.test'` over `skills`, `utils`, `docs`, `README.md`, `CLAUDE.md`):

- `docs/dev/building.md` line 8, "check_config.py on complete and broken configurations": the complete case and the refusal cases remain.
- `docs/dev/building.md` line 9, "sync_rules.py on matching and drifted shared-rules blocks, its --write repair and its refusals": the drift case checks the matching block after `--write` (`expect 0 python3 -B "$sync" "$test_root/drift"`), and four refusals remain.
- `docs/dev/building.md` line 10, "pin.sh in pin and check mode under a scratch HOME, its refusals included": both modes and five refusals remain.
- `docs/dev/building.md` line 11, "the coverage check on complete and broken coverage lists": the complete case and the refusal cases remain.
- `README.md` line 48, perl "for `sync_rules.test.sh`": the test still runs perl (`to_crlf`, the reversed and two-begins fixtures).
- `docs/dev/change-standard.md` lines 48-51 name the commands only.

## Judgment calls

- **What a case is.** Assertion groups inside a kept block that prove a separate behaviour were judged as cases of their own (pin's report and summary lines, its "reported once" count, its empty stdout on a refusal); they are rows of the removed tables. The kept blocks keep every other assertion.
- **Fixture steps in pin.test.sh.** Two removed pin runs also restored state for later cases. After the live-clone refusal, `rm "$d1/dev" "$d2/alpha"` stands in for the removed re-pin that removed them; after the check-after-linking case, `ln -s "$ORDO_STABLE/skills/beta" "$d2/beta"` stands in for the removed pin at the end of the not-reported cases. The state each later case starts from is the one it started from before.
- **Line numbers in check_coverage.test.sh.** Removing the fenced `## beta` (4 lines) and the `## gamma` section (5 lines) from `base.md` moves the alpha rows up 4 lines and ends the list 9 lines earlier. Six kept expectations carry the new numbers, each for the same error on the same row: listed-twice `:20:` and `(first at line 19)`, wrong-section `:20:`, unknown-mark `:19:`, unknown-skill `:17:`, empty-reason `:19:`, section-twice `:28:`. The test passes with them, and a wrong number would fail it.
- **Comments of kept cases edited.** Where a removal made a kept comment false it was rewritten on one line: the comment of the live-clone replacement case ("names it once ... and says so"), the `~/.agents/skills` comment ("with a line for each"), the resolved-path comment ("pin and check both pass"), the relative-folder comment, the codex-worker comment ("naming the accepted form"), the libraries loop comment, the libraries-avoid comment, the check_coverage "complete" and usage comments. The pass control comment on complete no longer mentions the fence.

## Found in the brief's reach

These are facts for the orchestrator; changing a kept case's fixture or the scripts is outside this step's paths and "No script changes. No case is added."

- `utils/pin.test.sh`, the not-a-worktree case: its folder `$HOME/plain` is inside no git repository, so with the refusal dropped the pin still stops when `git checkout` fails, and the case goes red only through its message line. The cost the refusal prevents, a checkout of an enclosing repository, is not built by the fixture.
- `utils/check_coverage.test.sh`, find-fails: the list has no `## locked` section, so with the return-code check dropped the list is still refused (exit 1) and the case goes red by exit status. A fixture whose locked folder has a section and hides an unlisted file would show the list accepted.
- `utils/pin.sh` line 69, `[ "$dir" = "$outside" ] && return 0`: no case of the original or the final test turns red when it is removed (`H pin CLAUDE_CONFIG_DIR=~/.agents, path comparison only | exit 0 | PASS: pin.sh scratch tests`), because every folder the tests compare exists and the resolved-path line matches it first.
