# 0059. A rulings file is named by its entry's number

Status: proposed

## Context

`grill` writes an entry's settled answers to a rulings file under `<ledger_root>/rulings/` named by the slug of its title while no plan is open, and `/plan` reads that file at the slug it derives from the entry's title, copies its bullets and removes it. The slug is derived from the title, and a roadmap diff that `grill` writes can change the title, as can a hand edit. The file is then at a path `/plan` does not read, and its rulings are not copied into the plan. Entry numbers never change once written (`docs/roadmap.md`, the introduction). A ledger folder is found by its `plan.md` title line, not by its name, and is not affected.

## Decision

- An entry's rulings file is `<ledger_root>/rulings/<number>.md`, the number written as the slug writes it, so that `3.A` gives `3-a.md`.
- `grill` and `plan` read and write it at that path, and every page that names the path names it so.
- The file is the entry's only when the number in its heading line `# Rulings: <number>. <title>` equals the entry's: `plan` copies it only then, and `grill`, with no plan open for the entry, stops on a file at that path whose heading holds another number or none.
- Each project of a `projects:` form, and each `plan.yaml`, has a ledger root of its own, since a file name holds the number alone.

## Alternatives rejected

- `grill` moves the file when its own roadmap diff changes the title: a title changed by hand or by another skill still leaves the file where `/plan` does not read it.
- `/plan` reads any rulings file whose name starts with the entry's number: the file of entry `3.A` would match entry `3`.

## Consequences

No change of an entry's title separates it from its rulings. The file name no longer says what the entry is, and its heading line `# Rulings: <entry>` does.

A file left at the number path by another entry, or with a heading that holds no number, is shown to the user and never copied or written over. The `ordo-init` skill's `check_config.py` refuses two projects of one form whose ledger roots resolve to one folder.
