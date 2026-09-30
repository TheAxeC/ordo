# A round in the decision form

The example is a roadmap entry for a command-line tool `tally`, which counts the words of text files. The Rulings of its plan already hold bullets `D1` to `D3`, `libraries` is `avoid` and the design bar is `industry`, so this round is numbered `D4` and `D5`. The goals of `tally` are counts a user can check against `wc -w`, settings a person edits by hand, and one meaning for each setting. The decision about the ADR is about the example repository's own pages, so its reference line is labelled "Rule:" and cites a file of that repository, whose lines are the example's.

## The round, as the user reads it

```
## D4. The format of the settings file

- **A. TOML.** *Pro:* a small specification with obvious semantics, and Python's `pyproject.toml` is one. *Con:* deeply nested settings are verbose.
- **B. YAML.** *Pro:* nesting is compact. *Con:* one value can parse to more than one type, so a setting can change meaning between readers.
- **C. JSON.** *Pro:* every language reads it. *Con:* it has no comments, and a settings file needs them.

**Industry:** Python packaging lets any tool keep its configuration in the `[tool]` table of `pyproject.toml`, a file "written in the TOML format" (https://peps.python.org/pep-0518/ , fetched in this session); the TOML specification calls itself "a minimal configuration file format that's easy to read due to obvious semantics" (https://toml.io/en/v1.0.0 , fetched in this session).

**Recommend A.** The goals ask for settings a person edits by hand with one meaning each: TOML allows comments, and each of its values has one type, where YAML's can change type between readers.

Lazy option: none. A, B and C cost the same to build.

## D5. What counts as a word

- **A. A run of characters delimited by white space.** *Pro:* one rule, the same result as `wc -w`, so a user can compare the two. *Con:* text in a script that does not separate words by spaces counts as one word per line.
- **B. Unicode word boundaries.** *Pro:* counts words in every script. *Con:* the rules are long, and a hyphenated compound counts as two words.
- **C. A now, boundaries for other scripts later.** *Pro:* it ships the count sooner. *Con:* the count is wrong for those scripts until the later work is done.

**Industry:** POSIX defines a word for `wc` as "a non-zero-length string of characters delimited by white space" (https://pubs.opengroup.org/onlinepubs/9699919799/utilities/wc.html , fetched in this session); Unicode's text segmentation standard defines word boundaries for selection, cursor movement and whole-word search, and lets an implementation tailor them (https://unicode.org/reports/tr29/ , fetched in this session).

**Recommend A.** The goals ask for counts a user can check against `wc -w`, and A gives the same count. B would count a hyphenated compound as two words and differ from `wc -w`.

Lazy option: C. It costs less now and leaves the count wrong for texts A does not cover.

Answer as `D<n> => <letter or text>`, one line per decision; `D<n> Agree` takes the recommendation; `D<a>-<b> Agree` takes it for a range.
```

## The answers

```
D4 Agree
D5 => B, tally is also to count texts in scripts that do not separate words by spaces
```

`D4 Agree` takes A. `D5 => B` takes B against the recommendation and adds a goal, counts for texts in every script, and the word "word" is now used in a sense the glossary lacks.

## What the answers write

The Rulings, or the rulings file when no plan is open, gain two bullets, in the same turn as the answers:

```
- D4 The format of the settings file (2026-09-30): TOML (the user).
- D5 What counts as a word (2026-09-30): Unicode word boundaries, since tally is also to count texts in scripts that do not separate words by spaces (the user).
```

The glossary, below the plan-terms block, gains the term the answer settled:

```
- **word**: a run of characters between two Unicode word boundaries.
```

D5 has alternatives rejected and binds the tool's later work, so the next round opens with this decision, numbered after the highest number shown:

```
## D6. Record D5 as an ADR

- **A. Record it.** *Pro:* the count's rule and the rejected alternatives stay findable after the plan closes. *Con:* one more record to keep current.
- **B. Keep it a Rulings line.** *Pro:* no new file. *Con:* the plan's ledger is archived when the plan closes, and the reason for the count goes with it.

**Rule:** `docs/adr/README.md:3` of the example repository keeps a record "per decision that is not obvious from the code and binds work after its plan closes".

**Recommend A.** The count decides what `tally` reports for every later feature, and a reader of the code cannot see why it was chosen.

Lazy option: B. It costs no file now and leaves the reason unrecorded.
```

On `D6 Agree`, the Rulings gain the bullet of the answer, in the same turn:

```
- D6 Record D5 as an ADR (2026-09-30): record it (the user).
```

The record is then written in the same turn in the folder `adr` names, from its `template.md`: numbered after its highest record, status `proposed`, its decision "Unicode word boundaries", its context the facts D5 gave, its alternatives rejected argued from the goal D5 added (A counts a text in a script without spaces as one word per line, which that goal rules out, and C leaves that count wrong until later work, which the same goal rules out now), its consequences that `tally` counts a hyphenated compound as two words and so differs from `wc -w` on it, that the boundaries are written by hand since `libraries` is `avoid`, and that a later change of the count supersedes the record; and its row in the folder's index.
