# Report: step 6, rulings D and E carried out

Everything in the brief is done.

## The cases' first run, on the unchanged tree

Each read on the tree before any change, with `grep -rn 'GLOSSARY.md' skills/explain/tutor`, `grep -n -i 'glossar' skills/explain/tutor/SKILL.md` and `grep -n -i 'font\|profile\|default\|does not state' docs/adr/0050-*.md`.

- A lesson of a topic with its own nomenclature reaches "Teaching" item 9: not met. Item 9 said "as HTML files in `reference/`" and "Write a glossary in the format of `references/glossary-format.md`.", naming no file, so the glossary would be an HTML file of no set name.
- A learning record that links `[[GLOSSARY.md]]`: not met. No step of `SKILL.md` wrote a file of that name; "The teaching workspace" listed only `reference/*.html`.
- A reader of ADR 0050 asks where the font size comes from when the venue states none: not met. The grep found only the opening sentence (line 11) and the Consequences line (line 26), neither of which answers it.
- `grep -rn 'GLOSSARY.md' skills/explain/tutor`: not met. It printed only the format pages' three lines (`learning-record-format.md:41`, `glossary-format.md:1`, `glossary-format.md:3`) and no line of `SKILL.md`.

No case is one the brief's own rules get wrong.

## The cases after the change

- Item 9 now writes the glossary to `reference/GLOSSARY.md` in the structure of `references/glossary-format.md` (`SKILL.md:105`): met.
- "The teaching workspace" lists `reference/GLOSSARY.md` among the reference documents (`SKILL.md:147`), so a `[[GLOSSARY.md]]` link has its file in `reference/`: met.
- ADR 0050's Decision has the bullet "A layout value the venue or the funder does not state comes from the declared format profile, and with no profile is the current default.": met.
- The grep below shows `SKILL.md` naming the file at the one path `reference/GLOSSARY.md`, and the format pages' lines as before: met.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. `tutor` item 9 names `reference/GLOSSARY.md`; "The teaching workspace" names it; version patch raised; format pages unchanged | DONE | `grep -rn 'GLOSSARY.md' skills/explain/tutor` (below); `python3 -c '...yaml.safe_load(...)["metadata"]'` printed `{'version': '1.0.1'}`; `git diff -- skills/explain/tutor/references \| wc -l` printed `0` |
| 2. ADR 0048 Decision: one line added | DONE | `git diff --numstat` row `1<tab>0<tab>docs/adr/0048-...` |
| 3. ADR 0050 Decision: one sentence added as a bullet under the opening sentence | DONE | `git diff --numstat` row `1<tab>0<tab>docs/adr/0050-...` |

Verify 1, `git diff --numstat` (10 lines added plus removed in all):

```
1<tab>0<tab>docs/adr/0048-tutor-is-a-copy-of-mattpocock-s-teach-with-the-name-an-explain-mode-and-its-page-added.md
1<tab>0<tab>docs/adr/0050-a-length-limit-is-met-by-cutting-content-and-the-layout-is-only-what-the-venue-or-funder-states.md
4<tab>4<tab>skills/explain/tutor/SKILL.md
```

Verify 2, the character-set check over the three changed files (fed by `git diff --name-only -z`): printed nothing, `ascii exit 0`.

Verify 3, `grep -rn 'GLOSSARY.md' skills/explain/tutor`:

```
skills/explain/tutor/SKILL.md:105:   - Write the glossary as the Markdown file `reference/GLOSSARY.md` of the teaching workspace, in the structure that `references/glossary-format.md` gives.
skills/explain/tutor/SKILL.md:147:- **`reference/*.html` and `reference/GLOSSARY.md`.** The reference documents: the compressed learnings from the lessons, which are the raw units of learning, such as cheat sheets, reference algorithms, syntax and yoga poses as HTML files, and the glossary as a Markdown file in the structure of `references/glossary-format.md`.
skills/explain/tutor/references/glossary-format.md:1:# GLOSSARY.md Format
skills/explain/tutor/references/glossary-format.md:3:`GLOSSARY.md` is the canonical language for this teaching workspace. All explainers, exercises, and learning records should adhere to its terminology. Building it is itself part of learning: compressing a concept into a tight definition is evidence the user understands it.
skills/explain/tutor/references/learning-record-format.md:41:- Anything already captured tersely in [[GLOSSARY.md]] as a term definition. Don't duplicate.
```

## Files changed

- `skills/explain/tutor/SKILL.md`: 4 added, 4 removed.
- `docs/adr/0048-tutor-is-a-copy-of-mattpocock-s-teach-with-the-name-an-explain-mode-and-its-page-added.md`: 1 added.
- `docs/adr/0050-a-length-limit-is-met-by-cutting-content-and-the-layout-is-only-what-the-venue-or-funder-states.md`: 1 added.

## Terms of `docs/glossary.md` the diff uses in a new place

- **teaching workspace**, in `SKILL.md` item 9's glossary bullet: the folder `/tutor` is run in, the sense the entry defines. The entry lists `reference/` among the folder's contents and stays true with the glossary inside `reference/`.
- **ADR** and **lesson** are not used in a new place. "format profile" and "reference document" are no terms of `docs/glossary.md` (checked with `grep -n -i 'format profile\|reference document' docs/glossary.md`, which printed no entry for either).

## Judgment calls

- `SKILL.md` "Teaching" item 9's opening sentence said "as HTML files in `reference/`"; with a Markdown glossary it would contradict the glossary bullet, so it now reads "in `reference/`, as HTML files except the glossary". This is the place item 1 of the brief calls "would now be incomplete".
- "The teaching workspace" bullet `reference/*.html` listed glossaries among the HTML reference documents; it now names `reference/GLOSSARY.md` beside `reference/*.html`. The clause "which are the raw units of learning" moved ahead of the list so that the list can end on the glossary's form; its words are unchanged.
- ADR 0048: the new bullet stands after the bullet on the name and before the two bullets on the explain mode, so those two stay together and no other line's closing punctuation changes. It ends in ";" as the bullets before the last do.
- ADR 0050: the new sentence is the first bullet under the opening sentence, as the brief allows; no other line of the record changed. The sentence holds for `grant` too: `skills/academic/grant/SKILL.md` "draft" item 7 writes `format-profile.yaml` from the funder config's "Layout" (`grep -rn -i 'format profile' skills/academic/grant`).
- Other places that list the teaching workspace's files were read and still hold: `docs/glossary.md` "teaching workspace" (names `reference/`), ADR 0048 Context (names `reference/`), `SKILL.md` line 11 and "What it reads" 3 (name the reference documents and the format pages, no folder contents). `README.md` names no tutor glossary (`grep -n -i 'glossar' README.md` hits only other skills).

## Each changed sentence, before and after

`skills/explain/tutor/SKILL.md`, frontmatter:
- Before: `version: "1.0.0"`
- After: `version: "1.0.1"`

`skills/explain/tutor/SKILL.md`, "Teaching" item 9, opening:
- Before: `9. Write the reference documents of the lesson, as HTML files in `reference/`, the compressed essence of the lesson in a form made for reference at a glance.`
- After: `9. Write the reference documents of the lesson in `reference/`, as HTML files except the glossary, the compressed essence of the lesson in a form made for reference at a glance.`

`skills/explain/tutor/SKILL.md`, "Teaching" item 9, glossary bullet:
- Before: `- Write a glossary in the format of `references/glossary-format.md`.`
- After: `- Write the glossary as the Markdown file `reference/GLOSSARY.md` of the teaching workspace, in the structure that `references/glossary-format.md` gives.`

`skills/explain/tutor/SKILL.md`, "The teaching workspace":
- Before: `- **`reference/*.html`.** The reference documents: the compressed learnings from the lessons, such as cheat sheets, reference algorithms, syntax, yoga poses and glossaries, which are the raw units of learning.`
- After: `- **`reference/*.html` and `reference/GLOSSARY.md`.** The reference documents: the compressed learnings from the lessons, which are the raw units of learning, such as cheat sheets, reference algorithms, syntax and yoga poses as HTML files, and the glossary as a Markdown file in the structure of `references/glossary-format.md`.`

ADR 0048, Decision, line added:
- After: `- the glossary is the Markdown file `reference/GLOSSARY.md`, which stands among the HTML reference documents, since the source's format page gives it that name and form;`

ADR 0050, Decision, line added:
- After: `- A layout value the venue or the funder does not state comes from the declared format profile, and with no profile is the current default.`
