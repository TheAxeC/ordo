"""Write the figure of academic-pipeline's stages and the skill each stage goes to.

The script imports the drawing engine skills/code/handbook/templates/figures.py and the kind
PAPER from docs/figures/ordo_kinds.py, both found from its own location, with
sys.dont_write_bytecode set so that no __pycache__ folder is written. Nothing is imported from
docs/figures/gen_figures.py, the other figure script. It builds its mapping of kinds once with
the engine's with_kinds: the engine's kinds, the kinds of box ap, rev, pipe and dr, which only
this figure uses, and paper, a run of another skill. It passes that mapping to the Canvas it
draws on.

Writes, beside this file, academic-pipeline.svg: the stages of academic-pipeline on the left and
the skill each goes to on the right.

Every box, arrow and label is written in this file, taken from the files of academic-pipeline in
research-hub and from docs/roadmap.md. The script reads none of them and no other input.

Run, from the repository root: python3 docs/figures/academic/researcher/gen_academic_pipeline.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. The figure carries its own light panel.

Errors, each printed to stderr as "error: <message>", with the figure, the box and the label
named the way the drawing engine names them:

- the drawing engine not found: the message names the engine's path and the ImportError;
- docs/figures/ordo_kinds.py not found, or PAPER missing from it: the message names the file and
  the ImportError;
- a box or a legend row whose kind the mapping of kinds does not hold;
- a label that does not fit its box, a word longer than a line, a note, a caption or a legend
  line that does not fit, two boxes that share a key, an edge that names a box the figure does
  not hold, an edge whose style is none of flow, dotted, back and return, or edges that form a
  cycle not marked as a return;
- a body that holds a non-ASCII character;
- a file that cannot be written or read back, or whose text read back differs from the body.

The label, kind and ASCII errors stop the run before the file is written.

Exit status: 0 the file written and verified, 1 an error above.
"""

import sys
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
ENGINE = Path("skills/code/handbook/templates/figures.py")

sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT / ENGINE.parent))
sys.path.insert(1, str(ROOT / "docs" / "figures"))
try:
    import figures as fg
except ImportError as error:
    print(
        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)
try:
    from ordo_kinds import PAPER
except ImportError as error:
    print(
        f"error: docs/figures/ordo_kinds.py cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)

FIGURE_KINDS = fg.with_kinds(
    {
        "ap": fg.Kind(fg.Style("#e3f4e8", "#15803d", "", "#14532d", 1.5, False), "ap"),
        "rev": fg.Kind(fg.Style("#efe7fb", "#7c3aed", "", "#3b0764", 1.5, False), "rev"),
        "pipe": fg.Kind(fg.Style(fg.SCRIPT_FILL, fg.EDGE, "", fg.INK, 1.5, False), "pipe"),
        "dr": fg.Kind(fg.Style("#f6eedc", "#a16207", "", "#422006", 1.5, False), "dr"),
        "paper": PAPER,
    }
)

N = fg.Node
E = fg.Edge
L = fg.Legend

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
    L("paper", "Teal: paper, paper-review-panel and researcher"),
    L("none", "Red dotted box: no skill takes it"),
    L("dotted", "Dotted arrow: goes to none; a solid arrow goes to a built skill"),
)


# ---------------------------------------------------------------------------------------
# academic-paper 3.2.0, simple view.


def pipeline_flow() -> fg.Graph:
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
    return fg.graph(nodes, edges, width=NODE_WIDTH)


class Stage(NamedTuple):
    """A stage of academic-pipeline, the skill it goes to, and whether the arrow is solid."""

    label: str
    kind: str
    target: str
    solid: bool


STAGES = (
    Stage("1 Research: deep-research", "dr", "RR", True),
    Stage("2 Write: academic-paper", "ap", "P1", True),
    Stage("2.5 Integrity check", "pipe", "RS", True),
    Stage("3 Review", "rev", "PRV", True),
    Stage("4, 3', 4' Revise and re-review", "ap", "P2", True),
    Stage("4.5 Final integrity check", "pipe", "RS", True),
    Stage("5 Finalize", "ap", "FC", True),
    Stage("6 Process summary", "pipe", "NO", False),
)

TARGETS = {
    "P1": ("paper plan and paper full", "paper"),
    "PRV": ("paper-review-panel", "paper"),
    "RR": ("researcher research", "paper"),
    "RS": ("researcher: the integrity and ethics checks, and the manuscript mode that runs the stages", "paper"),
    "P2": ("paper revision", "paper"),
    "FC": ("paper format-convert", "paper"),
    "NO": ("none", "none"),
}

PIPELINE_NOTE = (
    "The pipeline stops for you after every stage. D42 and D56: the integrity and ethics "
    "checks run in researcher, once on paper's finished draft and once after its revision."
)


def _lines(figure: str, where: str, label: str, width: float) -> list[str]:
    lines = fg.wrap(figure, where, label, width - 2 * fg.PAD_X, fg.NODE_SIZE)
    if len(lines) > fg.MAX_NODE_LINES:
        raise fg.FigureError(
            f"{figure}: {where}: the label {label!r} does not fit the box"
        )
    return lines


class MapBox(NamedTuple):
    """A box of the mapping panel, with its wrapped lines."""

    area: fg.Rect
    kind: str
    lines: list[str]


def map_layout(figure: str) -> tuple[list[MapBox], list[MapBox], dict[str, int]]:
    """Place the stage boxes in one column and each target at the mean of its stages."""
    stages: list[MapBox] = []
    cursor = 0.0
    for stage in STAGES:
        lines = _lines(figure, f"box {stage.label!r}", stage.label, STAGE_WIDTH)
        height = fg.node_height(lines)
        stages.append(
            MapBox(fg.Rect(0, cursor, STAGE_WIDTH, height), stage.kind, lines)
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
        height = fg.node_height(lines)
        mids = [
            stages[i].area.y + stages[i].area.h / 2
            for i, s in enumerate(STAGES)
            if s.target == key
        ]
        top = max(bottom + STAGE_GAP, sum(mids) / len(mids) - height / 2)
        targets.append(
            MapBox(
                fg.Rect(STAGE_WIDTH + 150, top, TARGET_WIDTH, height),
                kind,
                lines,
            )
        )
        index[key] = len(targets) - 1
        bottom = top + height
    return stages, targets, index


def pipeline_figure() -> str:
    name = "academic-pipeline.svg"
    flow = fg.FlowLayout(name, pipeline_flow())
    stages, targets, index = map_layout(name)
    map_width = STAGE_WIDTH + 150 + TARGET_WIDTH
    map_height = max(
        [box.area.y + box.area.h for box in (*stages, *targets)], default=0
    )
    top = fg.MARGIN + 24
    width = flow.width + PANEL_GAP + map_width + 2 * fg.MARGIN
    note_room = fg.note_height(name, PIPELINE_NOTE, width - 2 * fg.MARGIN)
    body = max(flow.height, map_height)
    height = (
        top + body + 20 + note_room + fg.legend_height(PIPELINE_LEGEND) + 3 * fg.MARGIN
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
    canvas = fg.Canvas(name, width, height, label, FIGURE_KINDS)
    fg.draw_caption(
        canvas, fg.MARGIN, fg.MARGIN + 6, "academic-pipeline: the 10 stages", flow.width
    )
    flow.draw(canvas, fg.MARGIN, top)
    left = fg.MARGIN + flow.width + PANEL_GAP
    fg.draw_caption(canvas, left, fg.MARGIN + 6, "where each stage goes now", map_width)
    for number, stage in enumerate(STAGES):
        source = stages[number].area
        target = targets[index[stage.target]].area
        canvas.path(
            [
                (left + source.x + source.w, top + source.y + source.h / 2),
                (left + target.x - 1, top + target.y + target.h / 2),
            ],
            fg.ACCENT,
            1.8,
            "" if stage.solid else fg.DOTTED,
            arrow=True,
        )
    for box in (*stages, *targets):
        area = fg.Rect(left + box.area.x, top + box.area.y, box.area.w, box.area.h)
        fg.draw_node(canvas, area, box.kind, box.lines)
    below = top + body + 20
    fg.draw_note(canvas, fg.MARGIN, below + 4, PIPELINE_NOTE, width - 2 * fg.MARGIN)
    fg.draw_legend(canvas, fg.MARGIN, below + note_room + fg.MARGIN, PIPELINE_LEGEND)
    return canvas.render()


def main() -> int:
    try:
        lines = fg.write_figures(HERE, (("academic-pipeline.svg", pipeline_figure()),), ROOT)
    except fg.FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
