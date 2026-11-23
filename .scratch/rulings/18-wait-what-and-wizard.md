# Rulings: 18. wait-what and wizard

- D1 (2026-11-23). Goal part, wait-what: kept as the entry writes it (the user).
- D2 (2026-11-23). Goal part, wizard: changed to name all three destinations, "writing each value to `.env`, a GitHub secret or a GitHub variable" (the user).
- D3 (2026-11-23). Gate part, wait-what: kept as the entry writes it (the user).
- D4 (2026-11-23). Gate part, wizard: kept as the entry writes it (the user).
- D6 (2026-11-23). Who may invoke wait-what: only the user, by typing it; its frontmatter holds `disable-model-invocation: true`, and `docs/dev/skill-layout.md`, "Frontmatter", gains that key as optional (the user).
- D7 (2026-11-23). Who may invoke wizard: the user and the model; the script is written to a scratch path and committed only on the user's word (the user).
- D8 (2026-11-23). Group folders: `wait-what` in `skills/ordo`, `wizard` in `skills/code` (the user).
- D9 (2026-11-23). The wizard template gets no test: "I dont think a test is necessary?" (the user).
- D10 (2026-11-23). Both skills are copies of their sources, mattpocock/skills `skills/productivity/wait-what` and `skills/engineering/wizard`, with only the differences this repository forces: the sections and frontmatter of `docs/dev/skill-layout.md`, the glossary found at the path the plan configuration lists, `template.sh` in ASCII and listed on `docs/dev/scripts.md`, no `agents/openai.yaml`, and the prose standard applied to the skill text. This answers D5 (the user).
- D11 (2026-11-23). The roadmap diff of D2 is written as shown: entry 18's goal reads "writing each value to `.env`, a GitHub secret or a GitHub variable" (the user).
- D12 (2026-11-23). D10 is recorded as an ADR, `docs/adr/0045-wait-what-and-wizard-are-copies-of-their-sources-with-the-differences-this-repository-forces.md`, status proposed (the user).

## Agents

- a84939439ef3b0753: grill lookup, claude-fable-5-2
