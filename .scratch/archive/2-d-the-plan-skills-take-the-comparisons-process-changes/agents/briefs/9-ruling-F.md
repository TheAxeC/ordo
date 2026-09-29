# Step 9, the ruling on open item F

The user ruled open item F (a): `/ordo-init` lists `docs/glossary.md` in `standards` whenever the repository has one. This adds to the brief `agents/briefs/9.md`; everything else in it stands.

12. `skills/ordo-init/SKILL.md`, Steps 7: the bullet "`standards` lists the coding, layout or prose standard pages the repository has." gains that it also lists `docs/glossary.md` when the repository has one, so every brief names it; `metadata.version` goes from "1.1.0" to "1.1.1". The description, when it names what `standards` holds, says the same, and stays at most 1,024 characters by the gate's length command.

Paths this step writes gains `skills/ordo-init/SKILL.md`.

Case: `grep -n 'glossary' skills/ordo-init/SKILL.md` prints the Steps 7 bullet after the change and nothing before; by reading, a repository `/repo-setup` sets up, whose `docs/glossary.md` exists, gets `docs/glossary.md` in the `standards` that `/ordo-init` drafts, and `check_config.py` accepts it (lines 54 to 56 require each page to exist).

The report gives item 12's change old beside new, the case's first run and its result, under a heading "Ruling F".
