# Building and checking Ordo

Ordo has no build step. The green check is every command below passing, each run from the repository root. Each test builds scratch repositories or scratch files under `$TMPDIR` and removes them; none touches the installed skills.

```sh
sh skills/code-comments/templates/strip_comments.test.sh   # strip_comments.py on pairs of C, C++ and CMake files that differ in a comment or in code, and on files it refuses
sh skills/land/templates/land.test.sh                  # land.sh on a conflict, a ledger file left in the worktree, a failing check, a clean landing and a step whose new test script and command, left uncommitted in the worktree, reach main and run there
sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
sh skills/paper/templates/anchorize_tex.test.sh        # anchorize_tex.py on scratch .tex files: the blocks of paragraphs, of a table and of a document environment, the .tex left unchanged, the manifest's spans
sh skills/paper/templates/apply_tex_patch.test.sh      # apply_tex_patch.py on scratch .tex files: a patch applied, a wrong hash, a stale manifest, two ops on a block, a structural change, an output equal to the input and --check-only
sh skills/paper/templates/calibration_counts.test.sh   # calibration_counts.py on tables of pairs: a table judged without error, a miss rate and a false-alarm rate at the limit, a label outside the three
sh skills/paper/templates/lookup.test.sh               # lookup.py on recorded response bodies and scratch .tex and .bib files, offline: matching, merging, cite-keys, the title check of check-urls, the arguments of quote-check, the verdict and the errors of resolve --entry, the published version of an arXiv ID in bibtex, the ASCII entry of bibtex and the title ratio of a converted entry, bibtex --page and resolve --entry on a venue's page, fetch --page, the PMCID line of resolve, text and text --abstract on saved HTML, XML and PDF files with a pdftotext stand-in, the URLs the other commands request, the pacing of each index across processes, the 429 handling and the reply cache
sh skills/paper/templates/reference_docx.test.sh       # reference_docx.py on pandoc's reference document, on scratch files: the layout defaults in the styles and the section properties, each profile field overriding its default, every other part byte for byte as pandoc wrote it, the refusal of a file that is not a .docx and of a value outside a field's form, and a conversion by pandoc with the written document
sh skills/repo-setup/templates/sync_rules.test.sh      # sync_rules.py --write on drifted shared-rules and plan-terms blocks, the bytes it keeps and its refusals
python3 skills/repo-setup/templates/sync_rules.py . --only glossary   # Ordo's glossary block equals plan-terms.md
sh utils/pin.test.sh                                   # pin.sh in pin and check mode under a scratch HOME, its refusals included
git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

A test that passes prints a last line starting with `PASS:` and exits 0; a failure prints a line starting with `FAIL:` and exits 1. The filter that keeps the summary line is `2>&1 | tail -1`.

`sh skills/land/templates/checks.sh <state file>`, the land skill's runner, runs a plan's verify list from the root of the checkout it checks and needs `python3` with PyYAML and `bash`. It runs every command in order through `bash -o pipefail -c`, whatever the exit of the one before, and prints `$ <command>` and the command's output. A landing books the lines it prints. Its exit status:

- `0`: every command exited 0, and it printed `checks: <n> commands passed`.
- `1`: one or more commands exited non-zero, and it printed `checks: failed with exit <status>: <command>` after each one's output and `checks: <k> of <n> commands failed` at the end.
- `2`: it refused before running anything: no argument or more than one, `python3`, PyYAML or `bash` missing, a state file it cannot read, no usable `yaml` block, or a `verify:` list that is missing, empty or holds an item that is not a command.
- `128+n`: a signal n ended `checks.sh` itself, and it printed no count line. An interrupt (Ctrl-C) exits 130 and also prints Python's `KeyboardInterrupt` traceback on standard error.

Each command in a verify list exits non-zero when it fails, as written. Commands that depend on each other are written as one item joined with `&&`, so the later one runs only when the earlier one passes. A command with long output uses its tool's quiet mode or a filter under `pipefail`, as the `2>&1 | tail -1` filter above runs, so a test that fails makes its pipeline fail.

The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk. A file deleted in a worktree and not yet staged is left out.

The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number. It exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line.

The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.

The figures under `docs/figures/` are written by two scripts and committed. `python3 docs/figures/gen_figures.py` writes `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `code-comments.svg` and the nine figures of `paper` under `docs/figures/paper/`, and `python3 docs/figures/academic-paper-comparison/gen_comparison.py` writes the 20 figures of `docs/figures/academic-paper-comparison/`. Every skill that launches agents has its figure under `docs/figures/`. A change to a skill's Stops table, its sequence, its agents, its cycles or its name changes the labels in the script that draws it, which is then run again. Neither script is part of the verify list.

This page is the list of tests and checks, and says how the committed figures are made; a new script is listed on `docs/dev/scripts.md`, and adds its test here and to the command block of `docs/dev/change-standard.md` only when it has one.
