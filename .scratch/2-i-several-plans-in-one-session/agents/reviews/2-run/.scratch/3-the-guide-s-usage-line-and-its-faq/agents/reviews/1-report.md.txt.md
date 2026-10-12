# Report: step 1 of plan 3, the usage sentence right after the install sentence

Everything in the brief is done.

## Open items of the state file

None. The state file was not read for this report; the brief and the task prompt name no open item for the builder.

## The cases' first run (unchanged tree, before any change)

Each case was run on the unchanged tree and none of the brief's rules gives a wrong result there, so no stop was needed.

- Case "After the change: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints `1`". Read first: line 3 ends with "Install it with `sh install.sh`." and holds no `sh run.sh`, so the pattern cannot match yet. Run on the unchanged tree it printed `0`, which is the expected state before the change. The case asks for `1` and is checked again after the change below.
- Case "Before the change: the same command prints `0`". Run on the unchanged tree: `0` (grep exit status 1, as grep -c gives when it counts zero).
- Case "`wc -l < docs/guide.md` prints `3` before and after". Run on the unchanged tree: `3`.

Reading of the unchanged tree (`cat -n docs/guide.md`):

```
     1 # Guide
     2 
     3 This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`.
```

The brief's premises were also read: `ls run.sh` prints "No such file or directory", `ls docs/adr` prints "No such file or directory", `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints `1`.

## DONE / NOT DONE

| Item | Status | Command | Output |
| --- | --- | --- | --- |
| Usage sentence added after the install sentence on line 3, naming `sh run.sh <name>` in backticks | DONE | `cat -n docs/guide.md` | line 3 ends "Install it with `sh install.sh`. Once the install has run, start it with `sh run.sh <name>`." |
| Lines 1 and 2 and every other sentence of line 3 unchanged | DONE | `cat -n docs/guide.md` | line 1 `# Guide`, line 2 blank, the first three sentences of line 3 as in the first run above |
| Verify 1: character-set check over the changed file | DONE | `printf '%s\0' docs/guide.md | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit $?"` | prints nothing; `exit 0` |
| Verify 2: case after the change | DONE | `sed -n 3p docs/guide.md \| grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` | `1` |
| Verify 3: line count | DONE | `wc -l < docs/guide.md` | `3` |
| Verify 4: sentence against the prose standard | DONE | read, see Judgment calls | no departure |
| ASCII scan of the prose standard's "How it is applied" | DONE | `LC_ALL=C grep -n '[^ -~]' docs/guide.md` | prints nothing (grep exit status 1) |

The brief's character-set command starts with `git ls-files`. No git command was run in this step, so the file list was given as `printf '%s\0' docs/guide.md | xargs -0 perl -CSD -ne '<the check copied from docs/dev/building.md>'`; the perl program is the one in docs/dev/building.md line 6, unchanged. The same check over docs/guide.md and this report file together printed nothing and exited 0, and `grep -c` for a tab character in this report prints 0.

## Files

- `docs/guide.md`: 3 lines (3 before and after); only line 3 changed.
- `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md`: this report.

## Judgment calls the brief left open

- The wording of the sentence. The brief fixes the command `sh run.sh <name>` in backticks and the position, and leaves the wording open. The sentence is "Once the install has run, start it with `sh run.sh <name>`." It names the command as the one to run once the install has run, as the brief asks, and uses "the install" for the step `sh install.sh` performs, since the install sentence just before it names the command.
- Prose standard check of the sentence, rule by rule: 11 words counting `sh run.sh <name>` as three, under the roughly 20 words limit of section E; the two sentences before the install sentence are 9 and 12 words and the install sentence is 5 words, so the paragraph has no run of five sentences of the same length; no em dash, spaced hyphen or `--`; no vocabulary of section A (no "just", "simply", "easy"); no throat-clearing opener of section C; active voice with the reader as the implied actor; the command is inline code, as section F asks for literals; one paragraph on one source line, as section F asks. The sentence departs from none of these rules, so no departure needs naming.
- `<name>` is written literally as the brief requires. The brief does not say what the name stands for and the sentence does not say either; no script `run.sh` exists (`ls run.sh` fails) and the brief says the step writes none.

## User-visible change

`docs/guide.md` line 3.

Before:

```
This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`.
```

After:

```
This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`. Once the install has run, start it with `sh run.sh <name>`.
```

## Anything in the brief that was wrong or impossible

Nothing found. The one point to note: the brief's after-case pattern `[^.]*\. [^.]*sh run\.sh <name>` requires that no full stop stands between the install sentence's full stop and `sh run.sh`, which the new sentence satisfies.
