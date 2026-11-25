# 0060. One standard-library drawing engine, kept in handbook, draws every figure

Status: proposed

## Context

Ordo's figures are drawn by `docs/figures/gen_figures.py`, a Python script that lays out each graph and writes its SVG itself, with only the standard library. ADR 0058 has `handbook` write diagrams for the software repositories it documents. The repositories read for that entry draw theirs with Graphviz, from `.dot` sources beside the `.svg`. A repository that `handbook` documents may have neither Graphviz nor any other drawing tool installed.

## Decision

- The layout engine of `gen_figures.py` is kept once, in `handbook`'s `templates/`.
- `handbook` copies it into a documented repository's `utils/`, writes each diagram as a graph in a Python file beside it, and commits the `.svg` it draws.
- `gen_figures.py` imports the engine from the skill's folder, so one engine draws Ordo's figures and every documented repository's diagrams.

## Alternatives rejected

- Graphviz: every documented repository would need it installed, while Ordo already has an engine that needs nothing beyond Python.
- A copy of the engine kept in `handbook` beside the one in `gen_figures.py`: the two copies drift apart.
- SVG written by hand: there is no source to diff, and the style drifts between diagrams.

## Consequences

A change to the engine changes Ordo's figures and the diagrams of the next `handbook` run alike, and both figure scripts are run again after it. A repository's diagrams can be redrawn from their graph files with `python3` alone.
