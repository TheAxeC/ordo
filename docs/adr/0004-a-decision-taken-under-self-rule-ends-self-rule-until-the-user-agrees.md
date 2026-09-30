# 0004. A decision taken under self-rule ends "(self-rule)" until the user agrees

Status: proposed

## Context

Under self-rule the orchestrator closes an open item with the option it recommends, except for six kinds of item that stay open for the user (`docs/roadmap.md`, entry 2.E.A). The plan skills take a step's authority, a quoted ruling and a carried ruling only from a bullet whose first line ends "(the user)" (`skills/spec/SKILL.md:44`, `skills/plan/SKILL.md:56`, `skills/grill/SKILL.md:55`). The user reviews each such decision later in the choices file and agrees or disagrees with it.

## Decision

A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)". A later ruling of the user replaces it without a rule clash. When the user agrees with it in review, its ending is rewritten to "(the user)", and only then is it a carried ruling for another entry.

## Alternatives rejected

- The bullet ends "(the user)" at once: it records the user's authority for a decision the user did not make.
- "(self-rule)" accepted as equal and never rewritten: a decision the user agreed with still does not read as the user's, so `grill` never carries it to another entry.

## Consequences

Every ruling says who decided it. The readers of the ending in `spec`, `plan` and `grill` change, and so do the glossary's **open item** and **ruling**. A skill added later that reads a ruling's authority reads both endings.
