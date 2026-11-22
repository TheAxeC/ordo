"""Write the figure of academic-pipeline's stages and the skill each stage goes to.

Imports the layout code of ../gen_figures.py, found from this file's own location. The import
writes a __pycache__ folder beside gen_figures.py, which git ignores.

Writes, beside this file, academic-pipeline.svg: the stages of academic-pipeline on the left and
the skill each goes to on the right.

Every box, arrow and label is written in this file, taken from the files of academic-pipeline in
research-hub and from docs/roadmap.md. The script reads none of them and no other input.

Run, from the repository root: python3 docs/figures/academic-pipeline/gen_academic_pipeline.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. The figure carries its own light panel.

Errors, each printed to stderr as "error: <message>", with the figure, the box and the label
named the way gen_figures.py names them:

- a label that does not fit its box, a word longer than a line, a note, a caption or a legend
  line that does not fit, two boxes that share a key, an edge that names a box the figure does
  not hold, an edge whose style is none of flow, dotted, back and return, or edges that form a
  cycle not marked as a return;
- a body that holds a non-ASCII character;
- a file that cannot be written or read back, or whose text read back differs from the body.

The label and ASCII errors stop the run before the file is written.

Exit status: 0 the file written and verified, 1 an error above.
"""

import sys
from collections.abc import Sequence
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

import gen_figures as gf

N = gf.Node
E = gf.Edge
L = gf.Legend

NODE_WIDTH = 214
PANEL_GAP = 40
STAGE_WIDTH = 200
TARGET_WIDTH = 232
STAGE_GAP = 16


PIPELINE_LEGEND = (
    L("ap", "Green: academic-paper"),
    L("rev", "Purple: academic-paper-reviewer"),
    L("pipe", "Grey: academic-pipeline itself"),
    L("dr", "Sand: deep-research"),
    L("paper", "Teal: paper"),
    L("todo", "Dashed box: not built yet, with its roadmap entry"),
    L("none", "Red dotted box: no skill takes it"),
    L(
        "dotted",
        "Dotted arrow: goes to a skill not built yet or to none; a solid arrow goes to paper",
    ),
)


def _g(
    nodes: Sequence[gf.Node],
    edges: Sequence[gf.Edge],
    floating: Sequence[gf.Node] = (),
    width: float = NODE_WIDTH,
) -> gf.Graph:
    return gf.Graph(tuple(nodes), tuple(edges), tuple(floating), width)


# ---------------------------------------------------------------------------------------
# academic-paper 3.2.0, simple view.


def pipeline_flow() -> gf.Graph:
    nodes = (
        N("S1", "1 Research: deep-research", "dr"),
        N("S2", "2 Write: academic-paper, plan or full", "ap"),
        N("S25", "2.5 Integrity check", "pipe"),
        N("S3", "3 Review: academic-paper-reviewer", "rev"),
        N("RJ", "Back to stage 2, or end"),
        N("S4", "4 Revise: academic-paper revision", "ap"),
        N("S3b", "3' Re-review", "rev"),
        N("S4b", "4' Re-revise, no review after", "ap"),
        N("S45", "4.5 Final integrity check, zero issues to pass", "pipe"),
        N("S5", "5 Finalize: DOCX, LaTeX, PDF", "ap"),
        N("S6", "6 Process summary", "pipe"),
    )
    edges = (
        E("S1", "S2"),
        E("S2", "S25"),
        E("S25", "S25", "fail: fix and check again, up to 3 rounds", "back"),
        E("S25", "S3", "pass"),
        E("S3", "RJ", "Reject"),
        E("S3", "S4", "Minor or Major"),
        E("S4", "S3b"),
        E("S3b", "S4b", "Major"),
        E("S3b", "S45", "Accept or Minor"),
        E("S3", "S45", "Accept"),
        E("S4b", "S45"),
        E("S45", "S45", "fail: fix and check again", "back"),
        E("S45", "S5", "pass"),
        E("S5", "S6"),
    )
    return _g(nodes, edges)


class Stage(NamedTuple):
    """A stage of academic-pipeline, the skill it goes to, and whether the arrow is solid."""

    label: str
    kind: str
    target: str
    solid: bool


STAGES = (
    Stage("1 Research: deep-research", "dr", "RS", False),
    Stage("2 Write: academic-paper", "ap", "P1", True),
    Stage("2.5 Integrity check", "pipe", "RS", False),
    Stage("3 Review", "rev", "PRV", False),
    Stage("4, 3', 4' Revise and re-review", "ap", "P2", True),
    Stage("4.5 Final integrity check", "pipe", "RS", False),
    Stage("5 Finalize", "ap", "FC", True),
    Stage("6 Process summary", "pipe", "NO", False),
)

TARGETS = {
    "P1": ("paper plan and paper full", "paper"),
    "PRV": ("paper-review-panel, entry 6", "todo"),
    "RS": ("researcher, entry 13: integrity and ethics checks, the stage loop", "todo"),
    "P2": ("paper revision", "paper"),
    "FC": ("paper format-convert", "paper"),
    "NO": ("none", "none"),
}

PIPELINE_NOTE = (
    "The pipeline stops for you after every stage. D42 and D56: the integrity and ethics "
    "checks run in researcher, once on paper's finished draft and once after its revision."
)


def _lines(figure: str, where: str, label: str, width: float) -> list[str]:
    lines = gf._wrap(figure, where, label, width - 2 * gf.PAD_X, gf.NODE_SIZE)
    if len(lines) > gf.MAX_NODE_LINES:
        raise gf.FigureError(
            f"{figure}: {where}: the label {label!r} does not fit the box"
        )
    return lines


class MapBox(NamedTuple):
    """A box of the mapping panel, with its wrapped lines."""

    area: gf.Rect
    kind: str
    lines: list[str]


def map_layout(figure: str) -> tuple[list[MapBox], list[MapBox], dict[str, int]]:
    """Place the stage boxes in one column and each target at the mean of its stages."""
    stages: list[MapBox] = []
    cursor = 0.0
    for stage in STAGES:
        lines = _lines(figure, f"box {stage.label!r}", stage.label, STAGE_WIDTH)
        height = gf._node_height(lines)
        stages.append(
            MapBox(gf.Rect(0, cursor, STAGE_WIDTH, height), stage.kind, lines)
        )
        cursor += height + STAGE_GAP
    order = sorted(
        TARGETS,
        key=lambda key: (
            sum(i for i, s in enumerate(STAGES) if s.target == key)
            / sum(1 for s in STAGES if s.target == key)
        ),
    )
    targets: list[MapBox] = []
    index: dict[str, int] = {}
    bottom = -STAGE_GAP
    for key in order:
        label, kind = TARGETS[key]
        lines = _lines(figure, f"box {label!r}", label, TARGET_WIDTH)
        height = gf._node_height(lines)
        mids = [
            stages[i].area.y + stages[i].area.h / 2
            for i, s in enumerate(STAGES)
            if s.target == key
        ]
        top = max(bottom + STAGE_GAP, sum(mids) / len(mids) - height / 2)
        targets.append(
            MapBox(
                gf.Rect(STAGE_WIDTH + 150, top, TARGET_WIDTH, height),
                kind,
                lines,
            )
        )
        index[key] = len(targets) - 1
        bottom = top + height
    return stages, targets, index


def pipeline_figure() -> str:
    name = "academic-pipeline.svg"
    flow = gf.FlowLayout(name, pipeline_flow())
    stages, targets, index = map_layout(name)
    map_width = STAGE_WIDTH + 150 + TARGET_WIDTH
    map_height = max(
        [box.area.y + box.area.h for box in (*stages, *targets)], default=0
    )
    top = gf.MARGIN + 24
    width = flow.width + PANEL_GAP + map_width + 2 * gf.MARGIN
    note_room = gf.note_height(name, PIPELINE_NOTE, width - 2 * gf.MARGIN)
    body = max(flow.height, map_height)
    height = (
        top + body + 20 + note_room + gf.legend_height(PIPELINE_LEGEND) + 3 * gf.MARGIN
    )
    boxes = (
        [(n.label, n.kind) for n in flow.graph.nodes]
        + [(s.label, s.kind) for s in STAGES]
        + [TARGETS[key] for key in TARGETS]
    )
    label = (
        "academic-pipeline: the 10 stages, and where each stage goes now. Boxes: "
        + "; ".join(text for text, _ in boxes)
        + "."
    )
    canvas = gf.Canvas(name, width, height, label)
    gf.draw_caption(
        canvas, gf.MARGIN, gf.MARGIN + 6, "academic-pipeline: the 10 stages", flow.width
    )
    flow.draw(canvas, gf.MARGIN, top)
    left = gf.MARGIN + flow.width + PANEL_GAP
    gf.draw_caption(canvas, left, gf.MARGIN + 6, "where each stage goes now", map_width)
    for number, stage in enumerate(STAGES):
        source = stages[number].area
        target = targets[index[stage.target]].area
        canvas.path(
            [
                (left + source.x + source.w, top + source.y + source.h / 2),
                (left + target.x - 1, top + target.y + target.h / 2),
            ],
            gf.ACCENT,
            1.8,
            "" if stage.solid else gf.DOTTED,
            arrow=True,
        )
    for box in (*stages, *targets):
        area = gf.Rect(left + box.area.x, top + box.area.y, box.area.w, box.area.h)
        gf.draw_node(canvas, area, box.kind, box.lines)
    below = top + body + 20
    gf.draw_note(canvas, gf.MARGIN, below + 4, PIPELINE_NOTE, width - 2 * gf.MARGIN)
    gf.draw_legend(canvas, gf.MARGIN, below + note_room + gf.MARGIN, PIPELINE_LEGEND)
    return canvas.render()


def main() -> int:
    try:
        lines = gf.write_figures(HERE, (("academic-pipeline.svg", pipeline_figure()),))
    except gf.FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
