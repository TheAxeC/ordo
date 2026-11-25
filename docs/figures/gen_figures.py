"""Write the SVG figures of the README: the runs of the skills that start agents.

Writes, beside this file:

- pipeline.svg: the commands of one roadmap entry in order, with the agents they start and the
  stops that wait on the user.
- plan-loop.svg: the commands of one step, /spec, build it, /refute, close them, /refute over
  the round and /land, with the /plan-orchestration band.
- grill.svg, writing.svg, code-comments.svg: the agents, stops and cycles of each skill.
- codebase-design.svg: the agents and stops of the standards mode and the review mode of the
  codebase-design skill.
- paper-review-panel.svg: the agents and stops of the full mode of the paper-review-panel skill, with the
  roles the other five modes start in its note.
- referee.svg: the agents and stops of the first round of the referee skill, with what the
  second round starts in its note.
- researcher.svg: the stages, agents, runs of other skills and stops of the manuscript mode of
  the researcher skill, with what the integrity mode runs alone in its note.
- submit.svg: the agent and stops of the submit skill, from the submission sheet to the page
  of the final submit.
- grant.svg: the agents and stops of the draft mode of the grant skill, with what the other
  four modes start in its note.
- paper/full.svg, paper/revision.svg, paper/lit-review.svg, paper/outline-only.svg,
  paper/abstract-only.svg, paper/citation-check.svg, paper/disclosure.svg, paper/plan.svg,
  paper/format-convert.svg, paper/revision-coach.svg, paper/rebuttal-audit.svg,
  paper/response-letter.svg: one figure per mode of the paper skill.
- paper/lifecycle.svg: the path of a manuscript through the modes of the paper skill, from a
  plan to resubmission: full mode and revision mode each hold the parts one run does, each
  part with the mode or call that runs it alone.
- paper/run-folder.svg: the agents of a full run in order, each arrow with the files the agent
  writes, and the path of a patch from an agent to the manuscript.

Every figure but the last two shows the order of a run. A box is an agent start or a task of a
resumed agent, solid when it always runs and dashed when it runs only when needed. A stop that
waits on the user is an orange box. A cycle is a dotted arrow with its cap, and a check an agent
repeats inside one start is a dotted loop on that agent with its cap. Scripts and the session's
own steps are left out, except where a paper figure draws them: a script the session runs is a
grey box, and a step where the session reads and judges is a rounded box, each with its legend
line. paper/lifecycle.svg draws no run: a frame is a mode or what you do outside the skill, and
a box in it is a part of that mode. paper/run-folder.svg draws the agents
of a full run with the files each writes on its arrows, and stops and cycles are left out of
it. Each of the two has its own legend.

Every box, arrow and label is written in this file, taken from each skill's SKILL.md and Stops
table, and for paper/lifecycle.svg also from the paper skill's mode selection guide; the script
reads no skill file and no other input. A change to a Stops table, to a skill's agents, its
cycles or its name is made in the labels below, and the script is run again.

This file is also the layout code of academic-pipeline/gen_academic_pipeline.py, which imports
it from its own folder's parent.

Run, from the repository root: python3 docs/figures/gen_figures.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. Each figure carries its own light panel, so it reads the same on a
light or a dark page.

Errors, each printed to stderr as "error: <message>":

- a label that does not fit its box: the message names the figure, the box and the label;
- a word longer than a line of its box: the message names the figure, the box, the word and the
  label;
- an edge label that does not fit, or a caption, a note or the legend that does not fit one line:
  the message names the figure, the place, the label and the width in pixels;
- an edge label for which no place beside its arrow is free of the boxes, the other labels and
  the arrows, after the gap under its row has grown to its limit: the message names the figure
  and the label;
- two boxes of one figure that share a key: the message names the figure;
- an edge that names a box the figure does not hold, or an edge whose style is none of flow,
  dotted, back and return: the message names the figure, the two ends of the edge and, for the
  box, its key or, for the style, the style;
- edges that form a cycle not marked as a return: the message names the figure;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label and ASCII errors stop the run before any file is written.

Exit status: 0 every file written and verified, 1 an error above.
"""

import sys
from collections.abc import Sequence
from dataclasses import dataclass
from html import escape
from itertools import pairwise
from pathlib import Path
from statistics import fmean
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent

INK = "#0f172a"
MUTED = "#475569"
EDGE = "#64748b"
PANEL = "#f8fafc"
CARD = "#ffffff"
ACCENT = "#4f46e5"
STOP = "#b45309"
STOP_FILL = "#fff1e6"
STOP_INK = "#7c2d12"
RULED = "#4338ca"
RULED_FILL = "#eef2ff"
RULED_INK = "#312e81"
SCRIPT_FILL = "#eceff3"
FONT = "ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif"

REGULAR_EM = 0.6
BOLD_EM = 0.68
CAPS_EM = 0.78
PAD_X = 10
TITLE_SIZE = 14
NODE_SIZE = 11.5
NODE_LEADING = 14
LABEL_SIZE = 10.5
LABEL_LEADING = 13
CAPTION_SIZE = 10
NOTE_SIZE = 11
MARGIN = 16
MIN_NODE_HEIGHT = 34
MAX_NODE_LINES = 8
MAX_LABEL_LINES = 5
LABEL_WIDTH = 150
LOOP_LABEL_WIDTH = 104
NODE_GAP = 34
DUMMY_WIDTH = 12
RANK_GAP = 46
GROW_STEP = 30
GROW_TRIES = 8
DOTTED = "2 4"
DASHED = "6 4"


class FigureError(Exception):
    """A label that does not fit, or a file that is not what was asked."""


class Rect(NamedTuple):
    """The position and size of a box, in pixels."""

    x: float
    y: float
    w: float
    h: float


class Style(NamedTuple):
    """How a kind of box is drawn."""

    fill: str
    stroke: str
    dash: str
    ink: str
    width: float
    pill: bool


STYLES = {
    "agent": Style(CARD, EDGE, "", INK, 1.5, False),
    "maybe": Style(CARD, EDGE, DASHED, INK, 1.5, False),
    "stop": Style(STOP_FILL, STOP, "", STOP_INK, 2, False),
    "script": Style(SCRIPT_FILL, EDGE, "", INK, 1.5, False),
    "ruled": Style(RULED_FILL, RULED, "", RULED_INK, 2, False),
    "ruled_maybe": Style(RULED_FILL, RULED, DASHED, RULED_INK, 2, False),
    "choice": Style(CARD, EDGE, "", INK, 1.5, True),
    "todo": Style(PANEL, EDGE, DASHED, MUTED, 1.5, False),
    "none": Style(PANEL, "#b91c1c", "2 3", "#991b1b", 1.5, False),
    "ap": Style("#e3f4e8", "#15803d", "", "#14532d", 1.5, False),
    "rev": Style("#efe7fb", "#7c3aed", "", "#3b0764", 1.5, False),
    "pipe": Style(SCRIPT_FILL, EDGE, "", INK, 1.5, False),
    "dr": Style("#f6eedc", "#a16207", "", "#422006", 1.5, False),
    "paper": Style("#dff3f1", "#0f766e", "", "#134e4a", 1.5, False),
}


@dataclass(frozen=True)
class Node:
    """A box of a flow figure; the key is what the edges name."""

    key: str
    label: str
    kind: str = "agent"


_BackLabel = tuple[
    tuple[float, float], tuple[float, float], list[str], int, tuple[int, ...] | None
]


@dataclass(frozen=True)
class Edge:
    """An arrow between two boxes.

    The style is "flow" for a solid arrow to a later box, "dotted" for a dotted arrow to a
    later box, "back" for a dotted arrow to an earlier box or, when both ends are one box,
    a dotted loop on it.
    """

    src: str
    dst: str
    label: str = ""
    style: str = "flow"


@dataclass(frozen=True)
class Graph:
    """The boxes and arrows of one flow, and the boxes that stand apart under it."""

    nodes: tuple[Node, ...]
    edges: tuple[Edge, ...]
    floating: tuple[Node, ...] = ()
    node_width: float = 210
    caption: str = ""


def _num(value: float) -> str:
    return f"{value:.1f}".rstrip("0").rstrip(".")


def _em(bold: bool, caps: bool = False) -> float:
    if caps:
        return CAPS_EM
    return BOLD_EM if bold else REGULAR_EM


def _wrap(
    figure: str, where: str, label: str, width: float, size: float, bold: bool = False
) -> list[str]:
    """Wrap a label greedily to the character budget of a width, conservative per character."""
    budget = int(width / (size * _em(bold)))
    lines: list[str] = []
    current = ""
    for word in label.split():
        if len(word) > budget:
            raise FigureError(
                f"{figure}: {where}: the word {word!r} of the label {label!r} is longer "
                "than a line"
            )
        if current and len(current) + 1 + len(word) > budget:
            lines.append(current)
            current = word
        else:
            current = f"{current} {word}".strip()
    if current:
        lines.append(current)
    return lines


def _check_line(
    figure: str,
    where: str,
    label: str,
    width: float,
    size: float,
    bold: bool = False,
    caps: bool = False,
) -> None:
    """A label drawn on one line must fit the width."""
    if len(label) * size * _em(bold, caps) > width:
        raise FigureError(
            f"{figure}: {where}: the label {label!r} does not fit one line of "
            f"{_num(width)} px"
        )


def _text_width(lines: Sequence[str], size: float) -> float:
    return max((len(line) for line in lines), default=0) * size * REGULAR_EM


class Canvas:
    """The SVG fragments of one figure, written in order."""

    def __init__(self, name: str, width: float, height: float, label: str) -> None:
        self.name = name
        self.width = width
        self.height = height
        self.label = label
        self.parts: list[str] = []

    def text(
        self,
        x: float,
        y: float,
        label: str,
        size: float,
        fill: str = INK,
        weight: str = "400",
        anchor: str = "start",
        halo: bool = False,
    ) -> None:
        outline = (
            f' stroke="{PANEL}" stroke-width="4" stroke-linejoin="round" paint-order="stroke"'
            if halo
            else ""
        )
        self.parts.append(
            f'<text x="{_num(x)}" y="{_num(y)}" font-family="{FONT}" '
            f'font-size="{_num(size)}" fill="{fill}" font-weight="{weight}" '
            f'text-anchor="{anchor}"{outline}>{escape(label, quote=False)}</text>'
        )

    def path(
        self,
        points: Sequence[tuple[float, float]],
        colour: str,
        width: float,
        dash: str = "",
        arrow: bool = False,
    ) -> None:
        d = "M" + " L".join(f"{_num(px)},{_num(py)}" for px, py in points)
        dash_attr = f' stroke-dasharray="{dash}"' if dash else ""
        marker_attr = ' marker-end="url(#arrow)"' if arrow else ""
        self.parts.append(
            f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="{_num(width)}"'
            f'{dash_attr}{marker_attr} stroke-linejoin="round"/>'
        )

    def rect(
        self,
        area: Rect,
        radius: float,
        fill: str,
        stroke: str,
        stroke_width: float = 1.5,
        dash: str = "",
    ) -> None:
        dash_attr = f' stroke-dasharray="{dash}"' if dash else ""
        self.parts.append(
            f'<rect x="{_num(area.x)}" y="{_num(area.y)}" width="{_num(area.w)}" '
            f'height="{_num(area.h)}" rx="{_num(radius)}" fill="{fill}" stroke="{stroke}" '
            f'stroke-width="{_num(stroke_width)}"{dash_attr}/>'
        )

    def render(self) -> str:
        head = (
            f'<svg xmlns="http://www.w3.org/2000/svg" '
            f'viewBox="0 0 {_num(self.width)} {_num(self.height)}" '
            f'width="{_num(self.width)}" height="{_num(self.height)}" role="img" '
            f'aria-label="{escape(self.label)}">'
        )
        marker = (
            '<marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" '
            'markerHeight="7" orient="auto">'
            f'<path d="M0,0 L10,5 L0,10 z" fill="{ACCENT}"/></marker>'
        )
        panel = (
            f'<rect x="0" y="0" width="{_num(self.width)}" height="{_num(self.height)}" '
            f'rx="10" fill="{PANEL}" stroke="{EDGE}"/>'
        )
        title = f"<title>{escape(self.label, quote=False)}</title>"
        body = [head, title, f"<defs>{marker}</defs>", panel, *self.parts, "</svg>"]
        return "\n".join(body) + "\n"


def draw_caption(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(
        canvas.name, "a caption", label, width, CAPTION_SIZE, bold=True, caps=True
    )
    canvas.text(x, y, label, CAPTION_SIZE, MUTED, "700")


def note_height(name: str, note: str, width: float) -> float:
    """The height a note takes when it is wrapped to a width; zero for no note."""
    if not note:
        return 0
    return 10 + len(_wrap(name, "a note", note, width, NOTE_SIZE)) * 15


def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    for index, line in enumerate(_wrap(canvas.name, "a note", label, width, NOTE_SIZE)):
        canvas.text(x, y + index * 15, line, NOTE_SIZE, MUTED)


def _node_height(lines: Sequence[str]) -> float:
    return max(MIN_NODE_HEIGHT, 18 + len(lines) * NODE_LEADING)


def draw_node(canvas: Canvas, area: Rect, kind: str, lines: Sequence[str]) -> None:
    """Draw a box of a kind with its lines centred in it."""
    style = STYLES[kind]
    radius = area.h / 2 if style.pill else 8
    canvas.rect(area, radius, style.fill, style.stroke, style.width, style.dash)
    top = area.y + (area.h - len(lines) * NODE_LEADING) / 2
    for index, line in enumerate(lines):
        baseline = top + index * NODE_LEADING + NODE_LEADING * 0.74
        canvas.text(
            area.x + area.w / 2, baseline, line, NODE_SIZE, style.ink, "400", "middle"
        )


class _Label(NamedTuple):
    """An edge label with its place."""

    area: Rect
    lines: list[str]


def _overlaps(first: Rect, second: Rect, slack: float = 2) -> bool:
    return not (
        first.x + first.w + slack <= second.x
        or second.x + second.w + slack <= first.x
        or first.y + first.h + slack <= second.y
        or second.y + second.h + slack <= first.y
    )


class FlowLayout:
    """Boxes and arrows of one Graph, laid out in ranks from the top.

    A rank holds the boxes that are the same number of arrows from the start. The order of the
    boxes in a rank minimises crossings by repeated sweeps, their places pull toward the boxes
    they connect to, and an arrow over several ranks passes through a gap of each rank it
    crosses.
    """

    def __init__(self, figure: str, graph: Graph) -> None:
        self.figure = figure
        self.graph = graph
        self.width = 0.0
        self.height = 0.0
        self._check_edges()
        self.kinds = {node.key: node.kind for node in (*graph.nodes, *graph.floating)}
        self.lines = {
            node.key: self._node_lines(node) for node in (*graph.nodes, *graph.floating)
        }
        self.loops = [edge for edge in graph.edges if edge.src == edge.dst]
        self.backs = [
            edge
            for edge in graph.edges
            if edge.style in ("back", "return") and edge.src != edge.dst
        ]
        self.forward = [
            edge for edge in graph.edges if edge.style not in ("back", "return")
        ]
        self.rank = self._rank()
        self._build_layers()
        self._order_layers()
        self.centres: dict[str, float] = {}
        self._place_x()
        self.extra_gap: dict[int, float] = {}
        for _ in range(GROW_TRIES):
            self.boxes: dict[str, Rect] = {}
            self.paths: list[tuple[list[tuple[float, float]], str]] = []
            self.labels: list[_Label] = []
            self.floating_boxes: dict[str, Rect] = {}
            self.crowded: dict[int, list[str]] = {}
            self._place_y()
            self._route()
            if not self.crowded:
                break
            for level in self.crowded:
                self.extra_gap[level] = self.extra_gap.get(level, 0.0) + GROW_STEP
        else:
            lines = next(iter(self.crowded.values()))
            raise FigureError(
                f"{figure}: the edge label {' '.join(lines)!r} has no free place "
                "beside its arrow"
            )
        self._finish()

    def _node_lines(self, node: Node) -> list[str]:
        width = self.graph.node_width - 2 * PAD_X
        lines = _wrap(self.figure, f"box {node.key!r}", node.label, width, NODE_SIZE)
        if len(lines) > MAX_NODE_LINES:
            raise FigureError(
                f"{self.figure}: box {node.key!r}: the label {node.label!r} does not fit "
                "the box"
            )
        return lines

    def _check_edges(self) -> None:
        keys = {node.key for node in self.graph.nodes}
        if len(keys) != len(self.graph.nodes):
            raise FigureError(f"{self.figure}: two boxes share a key")
        for edge in self.graph.edges:
            for key in (edge.src, edge.dst):
                if key not in keys:
                    raise FigureError(
                        f"{self.figure}: the edge {edge.src!r} to {edge.dst!r} names the "
                        f"box {key!r}, which the figure does not hold"
                    )
            if edge.style not in ("flow", "dotted", "back", "return"):
                raise FigureError(
                    f"{self.figure}: the edge {edge.src!r} to {edge.dst!r} has the "
                    f"style {edge.style!r}"
                )

    def _rank(self) -> dict[str, int]:
        rank = {node.key: 0 for node in self.graph.nodes}
        for _ in range(len(rank) + 1):
            moved = False
            for edge in self.forward:
                if rank[edge.dst] < rank[edge.src] + 1:
                    rank[edge.dst] = rank[edge.src] + 1
                    moved = True
            if not moved:
                return rank
        raise FigureError(
            f"{self.figure}: the edges form a cycle that is not marked as a return"
        )

    def _build_layers(self) -> None:
        self.layer_of = dict(self.rank)
        top = max(self.rank.values(), default=0)
        self.layers: list[list[str]] = [[] for _ in range(top + 1)]
        for node in self.graph.nodes:
            self.layers[self.rank[node.key]].append(node.key)
        self.chains: list[tuple[Edge, list[str]]] = []
        for index, edge in enumerate(self.forward):
            keys = [edge.src]
            for level in range(self.rank[edge.src] + 1, self.rank[edge.dst]):
                dummy = f"~{index}:{level}"
                self.layer_of[dummy] = level
                self.layers[level].append(dummy)
                keys.append(dummy)
            keys.append(edge.dst)
            self.chains.append((edge, keys))
        self.shifts: list[float] = []
        for edge, keys in self.chains:
            twins = [
                other
                for other, _ in self.chains
                if (other.src, other.dst) == (edge.src, edge.dst)
            ]
            at = twins.index(edge) if edge in twins else 0
            self.shifts.append((at - (len(twins) - 1) / 2) * 18)
        self.segments = [pair for _, keys in self.chains for pair in pairwise(keys)]
        self.up: dict[str, list[str]] = {key: [] for key in self.layer_of}
        self.down: dict[str, list[str]] = {key: [] for key in self.layer_of}
        for upper, lower in self.segments:
            self.up[lower].append(upper)
            self.down[upper].append(lower)

    def _crossings(self, layers: list[list[str]]) -> int:
        position = {key: i for layer in layers for i, key in enumerate(layer)}
        total = 0
        for first, second in _pairs(self.segments):
            if self.layer_of[first[0]] != self.layer_of[second[0]]:
                continue
            before = position[first[0]] - position[second[0]]
            after = position[first[1]] - position[second[1]]
            if before * after < 0:
                total += 1
        return total

    def _order_layers(self) -> None:
        best = [list(layer) for layer in self.layers]
        best_count = self._crossings(self.layers)
        for _ in range(12):
            for level in range(1, len(self.layers)):
                self._sort(level, self.up)
            for level in range(len(self.layers) - 2, -1, -1):
                self._sort(level, self.down)
            count = self._crossings(self.layers)
            if count < best_count:
                best_count = count
                best = [list(layer) for layer in self.layers]
        self.layers = best

    def _sort(self, level: int, neighbours: dict[str, list[str]]) -> None:
        other = level - 1 if neighbours is self.up else level + 1
        where = {key: i for i, key in enumerate(self.layers[other])}
        current = {key: i for i, key in enumerate(self.layers[level])}

        def score(key: str) -> tuple[float, int]:
            near = [where[n] for n in neighbours[key]]
            return (fmean(near) if near else current[key], current[key])

        self.layers[level].sort(key=score)

    def _extent(self, key: str) -> tuple[float, float]:
        """The offsets from the box centre to the left and right of the room it needs."""
        width = self.graph.node_width
        if key not in self.kinds:
            return (-DUMMY_WIDTH / 2, DUMMY_WIDTH / 2)
        extra = 0.0
        for edge in self.loops:
            if edge.src == key:
                lines = self._label_lines(edge, LOOP_LABEL_WIDTH)
                extra = max(extra, 30 + _text_width(lines, LABEL_SIZE))
        return (-width / 2, width / 2 + extra)

    def _label_lines(self, edge: Edge, width: float) -> list[str]:
        if not edge.label:
            return []
        lines = _wrap(
            self.figure,
            f"the edge {edge.src!r} to {edge.dst!r}",
            edge.label,
            width,
            LABEL_SIZE,
        )
        if len(lines) > MAX_LABEL_LINES:
            raise FigureError(
                f"{self.figure}: the edge {edge.src!r} to {edge.dst!r}: the label "
                f"{edge.label!r} does not fit {_num(width)} px"
            )
        return lines

    def _place_x(self) -> None:
        for layer in self.layers:
            cursor = 0.0
            for key in layer:
                low, high = self._extent(key)
                self.centres[key] = cursor - low
                cursor += high - low + NODE_GAP
            shift = (cursor - NODE_GAP) / 2
            for key in layer:
                self.centres[key] -= shift
        for _ in range(14):
            for level in range(1, len(self.layers)):
                self._relax(level, self.up)
            for level in range(len(self.layers) - 2, -1, -1):
                self._relax(level, self.down)

    def _relax(self, level: int, neighbours: dict[str, list[str]]) -> None:
        layer = self.layers[level]
        wanted = []
        for key in layer:
            near = [self.centres[n] for n in neighbours[key]]
            wanted.append(fmean(near) if near else self.centres[key])
        placed: list[float] = []
        for index, key in enumerate(layer):
            low = self._extent(key)[0]
            spot = wanted[index]
            if index:
                high_before = self._extent(layer[index - 1])[1]
                spot = max(spot, placed[-1] + high_before - low + NODE_GAP)
            placed.append(spot)
        offset = fmean([w - p for w, p in zip(wanted, placed, strict=True)])
        for key, spot in zip(layer, placed, strict=True):
            self.centres[key] = spot + offset

    def _place_y(self) -> None:
        heights = {key: _node_height(lines) for key, lines in self.lines.items()}
        self.heights = heights
        self.row_height = []
        for layer in self.layers:
            real = [heights[key] for key in layer if key in self.kinds]
            self.row_height.append(max(real, default=MIN_NODE_HEIGHT))
        self.label_lines = {
            index: self._label_lines(edge, LABEL_WIDTH)
            for index, (edge, _) in enumerate(self.chains)
        }
        self.gap_after = []
        for level in range(len(self.layers)):
            tallest = 0
            labelled = 0
            for index, (_, keys) in enumerate(self.chains):
                if self.layer_of[keys[0]] == level and self.label_lines[index]:
                    tallest = max(tallest, len(self.label_lines[index]))
                    labelled += 1
            leaving = sum(
                1 for _, keys in self.chains if self.layer_of[keys[0]] == level
            )
            room = 34 + tallest * LABEL_LEADING + 30 * max(0, labelled - 1)
            room += 24 * (leaving > 3)
            self.gap_after.append(max(RANK_GAP, room) + self.extra_gap.get(level, 0.0))
        top = 30 if self.graph.caption else MARGIN
        self.row_top = []
        for level in range(len(self.layers)):
            self.row_top.append(top)
            top += self.row_height[level] + self.gap_after[level]
        self.bottom = top - self.gap_after[-1] if self.layers else top

    def _box_of(self, key: str) -> Rect:
        level = self.layer_of[key]
        height = self.heights[key]
        y = self.row_top[level] + (self.row_height[level] - height) / 2
        width = self.graph.node_width
        return Rect(self.centres[key] - width / 2, y, width, height)

    def _route(self) -> None:
        for key in self.kinds:
            if key in self.layer_of:
                self.boxes[key] = self._box_of(key)
        placed: list[Rect] = list(self.boxes.values())
        pending = []
        for index, (edge, keys) in enumerate(self.chains):
            points = self._chain_points(keys, self.shifts[index])
            dash = DOTTED if edge.style == "dotted" else ""
            self.paths.append((points, dash))
            pending.append((index, points))
        back_labels = self._route_backs()
        twins = {(edge.dst, edge.src) for edge in self.backs}
        for index, points in pending:
            lines = self.label_lines[index]
            if lines:
                edge, keys = self.chains[index]
                level = self.layer_of[keys[0]]
                sides = (-1, 1) if (edge.src, edge.dst) in twins else None
                self._put_label(points[0], points[1], lines, placed, level, sides)
        for start, end, lines, level, sides in back_labels:
            self._put_label(start, end, lines, placed, level, sides)
        self._route_loops(placed)

    def _chain_points(
        self, keys: list[str], shift: float = 0
    ) -> list[tuple[float, float]]:
        first = self.boxes[keys[0]]
        points = [(first.x + first.w / 2 + shift, first.y + first.h)]
        for key in keys[1:-1]:
            level = self.layer_of[key]
            points.append((self.centres[key], self.row_top[level]))
            points.append(
                (self.centres[key], self.row_top[level] + self.row_height[level])
            )
        last = self.boxes[keys[-1]]
        points.append((last.x + last.w / 2 + shift, last.y))
        return points

    def _put_label(
        self,
        start: tuple[float, float],
        end: tuple[float, float],
        lines: list[str],
        placed: list[Rect],
        level: int,
        sides: tuple[int, ...] | None = None,
        fractions: Sequence[float] = (0.5, 0.4, 0.6, 0.3, 0.7, 0.2, 0.8, 0.1, 0.9),
    ) -> None:
        """Place a label beside its arrow, or mark the gap under its row as too small.

        The sides are tried in the order given, -1 for the left and 1 for the right; by default
        the label goes first on the side the arrow leans away from. A label of an arrow back to
        the row above takes the right side alone, away from the arrow it runs beside.
        """
        width = _text_width(lines, LABEL_SIZE) + 10
        height = len(lines) * LABEL_LEADING + 6
        chosen = None
        shallow = abs(end[1] - start[1]) < abs(end[0] - start[0])
        if sides is None:
            sides = (-1, 1) if end[0] < start[0] else (1, -1)
        for gap in (7, 16, 30, 50):
            for fraction in fractions:
                cx = start[0] + (end[0] - start[0]) * fraction
                cy = start[1] + (end[1] - start[1]) * fraction
                beside = [
                    Rect(
                        cx + side * (width / 2 + gap) - width / 2,
                        cy - height / 2,
                        width,
                        height,
                    )
                    for side in sides
                ]
                over = [
                    Rect(cx - width / 2, cy - height - gap + 4, width, height),
                    Rect(cx - width / 2, cy + gap - 4, width, height),
                ]
                for area in over + beside if shallow else beside + over:
                    if not any(
                        _overlaps(area, other) for other in placed
                    ) and not self._on_path(area):
                        chosen = area
                        break
                if chosen is not None:
                    break
            if chosen is not None:
                break
        if chosen is None:
            self.crowded.setdefault(level, lines)
            return
        placed.append(chosen)
        self.labels.append(_Label(chosen, lines))

    def _on_path(self, area: Rect) -> bool:
        """Whether an arrow crosses the area of a label."""
        for points, _ in self.paths:
            for first, second in pairwise(points):
                steps = max(
                    2,
                    int(max(abs(first[0] - second[0]), abs(first[1] - second[1])) / 3),
                )
                for step in range(steps + 1):
                    px = first[0] + (second[0] - first[0]) * step / steps
                    py = first[1] + (second[1] - first[1]) * step / steps
                    if area.x - 2 <= px <= area.x + area.w + 2 and (
                        area.y - 2 <= py <= area.y + area.h + 2
                    ):
                        return True
        return False

    def _right_edge(self) -> float:
        edge = max((box.x + box.w for box in self.boxes.values()), default=MARGIN)
        for key, box in self.boxes.items():
            edge = max(
                edge,
                box.x
                - self._extent(key)[0]
                - self.graph.node_width / 2
                + self._extent(key)[1]
                + self.graph.node_width / 2,
            )
        for key in self.layer_of:
            if key not in self.kinds:
                edge = max(edge, self.centres[key] + DUMMY_WIDTH / 2)
        return edge

    def _route_backs(self) -> list[_BackLabel]:
        """Draw the arrows back to an earlier box, and return their labels to place."""
        labels: list[_BackLabel] = []
        ordered = sorted(self.backs, key=lambda e: self.rank[e.src] - self.rank[e.dst])
        lane = self._right_edge() + 26
        previous = 0.0
        leaving: dict[int, int] = {}
        arriving: dict[int, int] = {}
        for edge in ordered:
            lines = self._label_lines(edge, LABEL_WIDTH)
            if self.rank[edge.src] - self.rank[edge.dst] == 1:
                source = self.boxes[edge.src]
                target = self.boxes[edge.dst]
                points = [
                    (source.x + source.w / 2 + 26, source.y),
                    (target.x + target.w / 2 + 26, target.y + target.h),
                ]
                self.paths.append((points, DOTTED if edge.style == "back" else ""))
                if lines:
                    labels.append(
                        (points[0], points[1], lines, self.rank[edge.dst], (1,))
                    )
                continue
            width = _text_width(lines, LABEL_SIZE) + 10 if lines else 0.0
            lane += previous / 2 + width / 2
            previous = width + 12
            source = self.boxes[edge.src]
            target = self.boxes[edge.dst]
            out = leaving.get(self.rank[edge.src], 0)
            leaving[self.rank[edge.src]] = out + 1
            into = arriving.get(self.rank[edge.dst], 0)
            arriving[self.rank[edge.dst]] = into + 1
            level = self.rank[edge.src]
            below = self.row_top[level] + self.row_height[level] + 12 + 6 * out
            above = self.row_top[self.rank[edge.dst]] - 12 - 6 * into
            points = [
                (source.x + source.w - 14 - 8 * out, source.y + source.h),
                (source.x + source.w - 14 - 8 * out, below),
                (lane, below),
                (lane, above),
                (target.x + target.w - 14 - 8 * into, above),
                (target.x + target.w - 14 - 8 * into, target.y),
            ]
            self.paths.append((points, DOTTED if edge.style == "back" else ""))
            if lines:
                labels.append(
                    ((lane, below), (lane, above), lines, self.rank[edge.dst], None)
                )
            lane += 12
        return labels

    def _route_loops(self, placed: list[Rect]) -> None:
        for edge in self.loops:
            box = self.boxes[edge.src]
            mid = box.y + box.h / 2
            right = box.x + box.w
            points = [
                (right, mid - 7),
                (right + 22, mid - 7),
                (right + 22, mid + 7),
                (right, mid + 7),
            ]
            self.paths.append((points, DOTTED))
            lines = self._label_lines(edge, LOOP_LABEL_WIDTH)
            if lines:
                width = _text_width(lines, LABEL_SIZE) + 10
                height = len(lines) * LABEL_LEADING + 6
                area = Rect(right + 28, mid - height / 2, width, height)
                placed.append(area)
                self.labels.append(_Label(area, lines))

    def _finish(self) -> None:
        low = min(
            [box.x for box in self.boxes.values()]
            + [x for points, _ in self.paths for x, _ in points]
            + [label.area.x for label in self.labels],
            default=0,
        )
        high = max(
            [box.x + box.w for box in self.boxes.values()]
            + [x for points, _ in self.paths for x, _ in points]
            + [label.area.x + label.area.w for label in self.labels],
            default=0,
        )
        shift = MARGIN - low
        width = high - low + 2 * MARGIN
        floating_top = self.bottom + 40
        per_row = max(1, int((width - MARGIN) // (self.graph.node_width + NODE_GAP)))
        keys = [node.key for node in self.graph.floating]
        tallest = max((self.heights[key] for key in keys), default=0)
        rows = 0
        for index, key in enumerate(keys):
            column = index % per_row
            rows = index // per_row
            height = self.heights[key]
            self.floating_boxes[key] = Rect(
                low + column * (self.graph.node_width + NODE_GAP),
                floating_top + rows * (tallest + 24),
                self.graph.node_width,
                height,
            )
        self.height = (
            floating_top + rows * (tallest + 24) + tallest + MARGIN
            if keys
            else self.bottom + MARGIN
        )
        self.width = max(width, MARGIN * 2)
        self.shift = shift

    def draw(self, canvas: Canvas, dx: float, dy: float) -> None:
        """Draw the arrows, then the boxes, then the arrow labels, at an offset."""
        left = dx + self.shift
        for points, dash in self.paths:
            moved = [(x + left, y + dy) for x, y in points]
            canvas.path(moved, ACCENT, 1.8, dash, arrow=True)
        for key, box in {**self.boxes, **self.floating_boxes}.items():
            area = Rect(box.x + left, box.y + dy, box.w, box.h)
            draw_node(canvas, area, self.kinds[key], self.lines[key])
        for label in self.labels:
            area = Rect(
                label.area.x + left, label.area.y + dy, label.area.w, label.area.h
            )
            for index, line in enumerate(label.lines):
                canvas.text(
                    area.x + area.w / 2,
                    area.y + 3 + index * LABEL_LEADING + LABEL_LEADING * 0.78,
                    line,
                    LABEL_SIZE,
                    MUTED,
                    "400",
                    "middle",
                    halo=True,
                )

    def keys(self) -> list[str]:
        """The keys of the boxes, in the order they were declared."""
        return [node.key for node in (*self.graph.nodes, *self.graph.floating)]


def _pairs(
    items: Sequence[tuple[str, str]],
) -> list[tuple[tuple[str, str], tuple[str, str]]]:
    return [
        (items[i], items[j])
        for i in range(len(items))
        for j in range(i + 1, len(items))
    ]


@dataclass(frozen=True)
class Panel:
    """A graph with a caption, drawn beside others in one figure."""

    caption: str
    graph: Graph


class Legend(NamedTuple):
    """One row of a legend: a sample and what it says."""

    sample: str
    meaning: str


SIMPLE_LEGEND = (
    Legend("agent", "Solid box: an agent start, or a task of a resumed agent, that always runs"),
    Legend(
        "maybe",
        "Dashed box: an agent start, or a task of a resumed agent, that runs only when needed",
    ),
    Legend("stop", "Orange box: the run stops for you"),
    Legend("dotted", "Dotted arrow: a cycle, with its cap"),
    Legend(
        "loop",
        "Dotted loop on one agent: a check it repeats inside its own start, with its cap",
    ),
)

PAPER_KIND_LEGEND = (
    Legend("script", "Grey box: a script the session runs, whose output is a fact"),
    Legend("choice", "Rounded box: the session reads and judges"),
)


def draw_legend(canvas: Canvas, x: float, y: float, rows: Sequence[Legend]) -> float:
    """Draw the legend rows, one under another, and return the height used."""
    draw_caption(canvas, x, y, "HOW TO READ THE FIGURE", 400)
    cursor = y + 14
    for row in rows:
        _check_line(
            canvas.name, "the legend", row.meaning, canvas.width - x - 60, NOTE_SIZE
        )
        if row.sample in STYLES:
            style = STYLES[row.sample]
            area = Rect(x, cursor, 28, 14)
            canvas.rect(
                area,
                7 if style.pill else 4,
                style.fill,
                style.stroke,
                style.width,
                style.dash,
            )
        elif row.sample == "dotted":
            canvas.path(
                [(x, cursor + 7), (x + 28, cursor + 7)], ACCENT, 1.8, DOTTED, True
            )
        else:
            canvas.path(
                [
                    (x, cursor + 2),
                    (x + 20, cursor + 2),
                    (x + 20, cursor + 12),
                    (x, cursor + 12),
                ],
                ACCENT,
                1.8,
                DOTTED,
                True,
            )
        canvas.text(x + 40, cursor + 11, row.meaning, NOTE_SIZE)
        cursor += 20
    return cursor - y


def legend_width(rows: Sequence[Legend]) -> float:
    """The width a legend needs for its longest row, with its sample and margins."""
    longest = max((len(row.meaning) for row in rows), default=0)
    return longest * NOTE_SIZE * REGULAR_EM + 40 + 60 + 2 * MARGIN


def legend_height(rows: Sequence[Legend]) -> float:
    return 14 + 20 * len(rows)


def compose(
    name: str,
    label: str,
    panels: Sequence[Panel],
    rows: Sequence[Legend],
    note: str = "",
) -> str:
    """Lay out the panels side by side, draw them with the legend and a note, and render."""
    layouts = [FlowLayout(name, panel.graph) for panel in panels]
    caption_room = 24
    top = MARGIN + caption_room
    width = sum(layout.width for layout in layouts) + 24 * (len(layouts) - 1)
    width = max(width + 2 * MARGIN, 640, legend_width(rows))
    height = top + max(layout.height for layout in layouts) + 20
    note_room = note_height(name, note, width - 2 * MARGIN)
    height += note_room + legend_height(rows) + 2 * MARGIN
    canvas = Canvas(name, width, height, label)
    cursor = (
        width - sum(layout.width for layout in layouts) - 24 * (len(layouts) - 1)
    ) / 2
    for panel, layout in zip(panels, layouts, strict=True):
        if panel.caption:
            draw_caption(canvas, cursor, MARGIN + 6, panel.caption, layout.width)
        layout.draw(canvas, cursor, top)
        cursor += layout.width + 24
    below = top + max(layout.height for layout in layouts) + 20
    if note:
        draw_note(canvas, MARGIN, below + 4, note, width - 2 * MARGIN)
        below += note_room
    draw_legend(canvas, MARGIN, below + MARGIN, rows)
    return canvas.render()


def describe(title: str, panels: Sequence[Panel]) -> str:
    """The text a figure carries for a reader who cannot see it: its boxes in order."""
    parts = []
    for panel in panels:
        names = {
            "agent": "agent",
            "maybe": "agent, only when needed",
            "stop": "stop",
            "script": "script",
            "ruled": "ruled",
            "ruled_maybe": "ruled, only when needed",
            "choice": "question",
            "todo": "not built yet",
            "none": "none",
            "paper": "a run of another skill",
        }
        boxes = [
            f"{node.label} ({names.get(node.kind, node.kind)})"
            for node in (*panel.graph.nodes, *panel.graph.floating)
        ]
        prefix = f"{panel.caption}: " if panel.caption else ""
        parts.append(prefix + "; ".join(boxes))
    return f"{title}. Boxes: " + " | ".join(parts) + "."


# ---------------------------------------------------------------------------------------
# Lanes: the commands of the plan skills, each with the agents it starts and the stops it has.


@dataclass(frozen=True)
class Lane:
    """A command with the boxes it holds, laid out in columns."""

    caption: str
    nodes: tuple[Node, ...]
    columns: int = 1
    node_width: float = 196


LANE_PAD = 10
LANE_HEAD = 26
LANE_GAP = 26


class _LaneBox(NamedTuple):
    frame: Rect
    cells: list[tuple[Rect, Node, list[str]]]


def _lane_box(figure: str, lane: Lane, x: float, y: float) -> _LaneBox:
    width = _lane_width(lane)
    cells = []
    cursor = y + LANE_HEAD
    for start in range(0, len(lane.nodes), lane.columns):
        row = lane.nodes[start : start + lane.columns]
        lines = [
            _wrap(
                figure,
                f"box {node.key!r}",
                node.label,
                lane.node_width - 2 * PAD_X,
                NODE_SIZE,
            )
            for node in row
        ]
        for node, wrapped in zip(row, lines, strict=True):
            if len(wrapped) > MAX_NODE_LINES:
                raise FigureError(
                    f"{figure}: box {node.key!r}: the label {node.label!r} does not fit "
                    "the box"
                )
        height = max(_node_height(wrapped) for wrapped in lines)
        for column, (node, wrapped) in enumerate(zip(row, lines, strict=True)):
            left = x + LANE_PAD + column * (lane.node_width + LANE_PAD)
            cells.append((Rect(left, cursor, lane.node_width, height), node, wrapped))
        cursor += height + LANE_PAD
    frame = Rect(x, y, width, cursor - y)
    return _LaneBox(frame, cells)


def _lane_width(lane: Lane) -> float:
    return lane.columns * lane.node_width + (lane.columns + 1) * LANE_PAD


def _lane_height(figure: str, lane: Lane) -> float:
    return _lane_box(figure, lane, 0, 0).frame.h


@dataclass(frozen=True)
class Row:
    """A row of lanes in order, with arrows from each lane to the next."""

    caption: str
    lanes: tuple[Lane, ...]
    arrows: bool = True
    returns: tuple[tuple[int, int, str], ...] = ()


def lanes_figure(
    name: str, label: str, rows: Sequence[Row], legend: Sequence[Legend], note: str = ""
) -> str:
    """Draw rows of lanes, the arrows between them, the returns, a note and the legend."""
    widths = [
        sum(_lane_width(lane) for lane in row.lanes) + LANE_GAP * (len(row.lanes) - 1)
        for row in rows
    ]
    width = max(max(widths) + 2 * MARGIN, 700, legend_width(legend))
    heights = [max(_lane_height(name, lane) for lane in row.lanes) for row in rows]
    room = [34 + (36 if row.returns else 0) for row in rows]
    height = MARGIN + sum(h + r for h, r in zip(heights, room, strict=True))
    note_room = note_height(name, note, width - 2 * MARGIN)
    height += note_room + legend_height(legend) + 3 * MARGIN
    canvas = Canvas(name, width, height, label)
    cursor = MARGIN
    for row, row_width, row_height in zip(rows, widths, heights, strict=True):
        draw_caption(canvas, MARGIN, cursor + 12, row.caption, width - 2 * MARGIN)
        cursor += 22
        left = MARGIN
        frames = []
        for lane in row.lanes:
            box = _lane_box(name, lane, left, cursor)
            _check_line(
                name,
                f"the lane {lane.caption!r}",
                lane.caption,
                box.frame.w - 2 * LANE_PAD,
                13,
                bold=True,
            )
            full = Rect(box.frame.x, box.frame.y, box.frame.w, row_height)
            canvas.rect(full, 10, CARD, EDGE, 1.5)
            canvas.text(
                box.frame.x + LANE_PAD, cursor + 17, lane.caption, 13, INK, "700"
            )
            for area, node, wrapped in box.cells:
                draw_node(canvas, area, node.kind, wrapped)
            frames.append(full)
            left += box.frame.w + LANE_GAP
        if row.arrows:
            for before, after in pairwise(frames):
                y = cursor + 14
                canvas.path(
                    [(before.x + before.w, y), (after.x - 1, y)], ACCENT, 2, arrow=True
                )
        for source, target, cap in row.returns:
            _draw_return(canvas, frames[source], frames[target], cap, row_height)
        cursor += row_height + 12 + (36 if row.returns else 0)
        _ = row_width
    if note:
        draw_note(canvas, MARGIN, cursor + 6, note, width - 2 * MARGIN)
        cursor += note_room
    draw_legend(canvas, MARGIN, cursor + MARGIN, legend)
    return canvas.render()


def _draw_return(
    canvas: Canvas, source: Rect, target: Rect, cap: str, row_height: float
) -> None:
    """A dotted arrow under a row from one lane back to an earlier lane, with its cap."""
    bottom = source.y + row_height
    low = bottom + 20
    x_from = source.x + source.w / 2
    x_to = target.x + target.w / 2
    canvas.path(
        [(x_from, bottom), (x_from, low), (x_to, low), (x_to, bottom + 1)],
        ACCENT,
        1.8,
        DOTTED,
        arrow=True,
    )
    _check_line(canvas.name, "a cycle label", cap, abs(x_from - x_to) + 160, NOTE_SIZE)
    canvas.text((x_from + x_to) / 2, low + 15, cap, NOTE_SIZE, MUTED, "400", "middle")


# ---------------------------------------------------------------------------------------
# The figures.

FLOW_WIDTH = 214
MODEL = "A model other than the configured one"


def _graph(
    nodes: Sequence[Node],
    edges: Sequence[Edge],
    floating: Sequence[Node] = (),
    width: float = FLOW_WIDTH,
    caption: str = "",
) -> Graph:
    return Graph(tuple(nodes), tuple(edges), tuple(floating), width, caption)


def _single(
    name: str, title: str, graph: Graph, note: str = "", legend: Sequence[Legend] = ()
) -> str:
    panels = [Panel("", graph)]
    return compose(
        name,
        describe(title, panels),
        panels,
        legend or SIMPLE_LEGEND,
        note,
    )


STOPS_NOT_DRAWN = (
    "Not drawn, since they hold in every mode: at every patch, a structural patch, a "
    "patch that does not apply or a failed script stops the run."
)


MODE_STOP = Node("MS", "The mode to run, for a plain request that fits two modes", "stop")
CLAIM_NOT_HELD = "the check stops at the first claim not held, and the stop is raised once the agent has ended"
CLAIM_CHECK = "Citation compliance: each claim against its source's full text, unless you said no"
STYLE_STOP = "The citation style to confirm"
STYLE_EDGE = "more than half the cited entries in another style than the Citation Format row"
STYLE_BACK = "your answer: resumed for the format work only"
RESULTS_FIX = "Draft writer, resumed: the statements the result files do not bear out, as a patch"
REFERENCE_STOP = "A reference that cannot be confirmed, only under strict"


def with_mode_stop(graph: Graph) -> Graph:
    """The graph with the stop every mode of paper lists, the mode to run, standing apart."""
    return Graph(
        graph.nodes, graph.edges, (*graph.floating, MODE_STOP), graph.node_width, graph.caption
    )


def _paper(name: str, mode: str, graph: Graph) -> str:
    graph = with_mode_stop(graph)
    kinds = {node.kind for node in (*graph.nodes, *graph.floating)}
    legend = (
        *SIMPLE_LEGEND,
        *(row for row in PAPER_KIND_LEGEND if row.sample in kinds),
    )
    return _single(
        f"paper/{name}.svg",
        f"The {mode} mode of the paper skill",
        graph,
        STOPS_NOT_DRAWN,
        legend,
    )


STRUCTURE = "Session: one literature strategist, or several with a merge, written in config.md"
STARTS = "Literature strategists, the starts the session briefs, at once"
MERGE = "Literature strategist, the merge the session briefs: "
ONE = "one strategist"
SEVERAL = "several, with a merge"
SEARCH_LOOP = "search rounds: 3 of 5 stopping rules, or 4 rounds"
CONFIRMED = "review.md and refs.bib written with its own edits"


SEARCH_STOP = "search rounds: end at any 3 of 5 conditions, or after 4 rounds"
PATCHED = "Script: each patch applied, the compile, the reference checks"
WRITING = "/writing review, unless you said no"
REPLY_STOP = "The reply to the closing review"
FINDINGS = "Draft writer, resumed: the findings you pick, as a patch"
SESSION_STOP = "The session's questions, in one message"
RESTRUCTURE_STOP = "A revision item that needs restructuring"
REPLACE_STOP = "A converted file to replace"
LIMIT_CUT = "Draft writer, resumed: content cut once, when over a declared word or page limit"


def _search(after: str) -> tuple[tuple[Node, ...], tuple[Edge, ...]]:
    """The session's choice of one literature strategist or several with a merge."""
    nodes = (
        Node("S", STRUCTURE, "choice"),
        Node("L", "Literature strategist, unless you give your own sources", "maybe"),
        Node("T2", STARTS, "maybe"),
        Node("M", MERGE + "review.md and refs.bib", "maybe"),
        Node("LR", "You review the sources, optional", "stop"),
    )
    edges = (
        Edge("S", "L", ONE),
        Edge("S", "T2", SEVERAL),
        Edge("L", "L", SEARCH_STOP, "back"),
        Edge("T2", "T2", SEARCH_STOP, "back"),
        Edge("T2", "M"),
        Edge("L", "LR"),
        Edge("M", "LR"),
        Edge("LR", after),
    )
    return nodes, edges


def paper_full_graph() -> Graph:
    search_nodes, search_edges = _search("A")
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        *search_nodes,
        Node("A", "Structure architect"),
        Node("OA", "Outline approval", "stop"),
        Node("B", "Argument builder"),
        Node("W", "Draft writer, 2 calls: main.tex"),
        Node("GA", "A generator phase aborted", "stop"),
        Node("V", "Visualization, with data: the figures placed by patch", "maybe"),
        Node("C", CLAIM_CHECK),
        Node("SS", STYLE_STOP, "stop"),
        Node("AB", "Abstract agent: a patch"),
        Node("P", "Peer reviewer, 2 calls"),
        Node("RF", RESULTS_FIX, "maybe"),
        Node("WR", "Draft writer, resumed: the whole draft again, as one patch"),
        Node(
            "IC",
            "Citation compliance, resumed: the cited sentences of the patch, unless you said no",
            "maybe",
        ),
        Node("SD", "The draft review does not pass", "stop"),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("CF", PATCHED, "script"),
        Node("F", "Formatter: targets, cover letter, AI disclosure, checklist"),
        Node("LC", LIMIT_CUT, "maybe"),
        Node("SO", REPLACE_STOP, "stop"),
        Node("WG", WRITING, "maybe"),
        Node("WS", REPLY_STOP, "stop"),
        Node("WA", FINDINGS, "maybe"),
    )
    edges = (
        Edge("I", "S"),
        *search_edges,
        Edge("A", "OA"),
        Edge("OA", "A", "restructuring, no cap", "back"),
        Edge("OA", "B"),
        Edge("B", "W"),
        Edge("B", "V"),
        Edge("V", "V", "checks the rendered figure, up to 2 fixes, optional", "back"),
        Edge("W", "GA", "a 4a lint fails twice, or a 4b lint fails"),
        Edge("W", "C"),
        Edge("W", "AB"),
        Edge("C", "SS", STYLE_EDGE),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "RF"),
        Edge("RF", "P"),
        Edge("C", "P"),
        Edge("AB", "P"),
        Edge("V", "P"),
        Edge("P", "WR", "a revision: round 2, once", "dotted"),
        Edge("WR", "IC"),
        Edge("IC", "P", "", "back"),
        Edge("P", "GA", "a 6a lint fails twice, or a 6b lint fails"),
        Edge("P", "SD", "after round 2 a score under 6.5 with a Critical issue open"),
        Edge("P", "CF"),
        Edge("CF", "SR", "a failure left after the reference fix"),
        Edge("CF", "F"),
        Edge("F", "F", "a checklist item fails, no cap", "back"),
        Edge("F", "SO", "a converted output already stands"),
        Edge("F", "LC"),
        Edge("LC", "WG"),
        Edge("WG", "WS"),
        Edge("WS", "WA"),
    )
    return _graph(nodes, edges)


def paper_revision_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("P", "Peer reviewer: the comments as a roadmap"),
        Node("W", "Draft writer: a patch per item"),
        Node("SX", RESTRUCTURE_STOP, "stop"),
        Node("C", CLAIM_CHECK),
        Node("SS", STYLE_STOP, "stop"),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("RF", RESULTS_FIX, "maybe"),
        Node("R2", "Peer reviewer, resumed: the re-review"),
        Node("CF", PATCHED, "script"),
        Node("RL", "Draft writer, resumed: the response letter, for referee comments", "maybe"),
        Node("RC", "Peer reviewer, resumed: the letter checked, a verdict per point", "maybe"),
        Node("WG", WRITING, "maybe"),
        Node("WS", REPLY_STOP, "stop"),
        Node("WA", FINDINGS, "maybe"),
        Node("X", "Revised draft, the rest as limitations"),
    )
    edges = (
        Edge("SQ", "P"),
        Edge("P", "W"),
        Edge("W", "SX", "the writer's tag in place of a patch"),
        Edge("SX", "W", "a full re-emission, or narrowed items", "back"),
        Edge("W", "C"),
        Edge("C", "SS", STYLE_EDGE),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "RF"),
        Edge("RF", "R2"),
        Edge("C", "R2", "round 2, once"),
        Edge("R2", "CF", "the items not resolved become limitations"),
        Edge("CF", "SR", "a failure left after the reference fix"),
        Edge("CF", "RL"),
        Edge("RL", "RC"),
        Edge("RC", "WG"),
        Edge("CF", "WG", "a /writing report as the comments"),
        Edge("WG", "WS"),
        Edge("WS", "WA"),
        Edge("WA", "X"),
    )
    return _graph(nodes, edges)


def paper_lit_review_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("S", STRUCTURE, "choice"),
        Node("L", "Literature strategist: the synthesis analysis too; " + CONFIRMED, "maybe"),
        Node("T2", STARTS, "maybe"),
        Node("M", MERGE + "the synthesis analysis too; " + CONFIRMED, "maybe"),
        Node("SJ", "Session: each start's report read", "choice"),
        Node("SC", "Script: every entry's DOI or arXiv ID resolved, one resolve over refs.bib", "script"),
        Node("L2", "Literature strategist that wrote refs.bib, resumed with the identifier check: titles resolved, strict: a failing identifier corrected or removed", "maybe"),
        Node("CK", "Script: every entry resolved again, one resolve over refs.bib", "script"),
        Node("LR", "You review the sources, optional", "stop"),
        Node("RC", "Script: each corrected or added entry's DOI or arXiv ID resolved again", "script"),
        Node("SR", "A reference that cannot be confirmed", "stop"),
    )
    edges = (
        Edge("I", "S"),
        Edge("S", "L", ONE),
        Edge("S", "T2", SEVERAL),
        Edge("L", "L", SEARCH_LOOP, "back"),
        Edge("T2", "T2", SEARCH_LOOP, "back"),
        Edge("T2", "M"),
        Edge("L", "SJ"),
        Edge("M", "SJ"),
        Edge("SJ", "SC"),
        Edge("SC", "L2"),
        Edge("L2", "CK"),
        Edge("CK", "SR", "strict: an identifier still fails"),
        Edge("CK", "LR"),
        Edge("LR", "RC"),
        Edge("RC", "SR", "strict: an identifier still fails"),
    )
    return _graph(nodes, edges)


def paper_outline_only_graph() -> Graph:
    search_nodes, search_edges = _search("A")
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        *search_nodes,
        Node("A", "Structure architect"),
        Node("OA", "Outline approval", "stop"),
    )
    edges = (
        Edge("I", "S"),
        *search_edges,
        Edge("A", "OA"),
        Edge("OA", "A", "restructuring, no cap", "back"),
    )
    return _graph(nodes, edges)


def paper_abstract_only_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("AB", "Abstract agent: a patch"),
    )
    return _graph(nodes, (Edge("I", "AB"),))


def paper_citation_check_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("C", "Citation compliance: each claim against its source's full text"),
        Node(
            "SS",
            "The citation style to confirm, when more than half the cited entries follow "
            "another style than the Citation Format row",
            "stop",
        ),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("X", "Citation report"),
    )
    edges = (
        Edge("SQ", "C"),
        Edge("C", "SS"),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "X"),
    )
    return _graph(nodes, edges)


def paper_disclosure_graph() -> Graph:
    nodes = (
        Node(
            "S",
            "You name the venue, and paste the policy of a venue it does not know",
            "stop",
        ),
        Node("F", "Formatter: each kind of AI use marked, the statement as a patch"),
        Node("U", "You confirm each uncertain kind of AI use", "stop"),
    )
    edges = (
        Edge("S", "F"),
        Edge("F", "U", "a kind marked uncertain"),
        Edge("U", "F", "your answer", "back"),
    )
    return _graph(nodes, edges)


def paper_plan_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: 3 questions, you confirm", "stop"),
        Node("M", "Socratic mentor, chapter by chapter, given each answer"),
        Node("Q", "The mentor's question", "stop"),
        Node("S", "Structure architect: the outline"),
        Node("M2", "Socratic mentor and argument builder: the stress test"),
        Node("X", "Chapter plan and INSIGHT collection"),
    )
    edges = (
        Edge("I", "M"),
        Edge("M", "Q"),
        Edge("Q", "M", "offers after 8 rounds on a chapter, suggests outline-only past 15 in all", "back"),
        Edge("M", "S"),
        Edge("S", "M2"),
        Edge("M2", "X"),
    )
    return _graph(nodes, edges)


def paper_format_convert_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("ST", "The target to settle", "stop"),
        Node("F", "Formatter: LaTeX, DOCX, PDF, Markdown, citation style, as patches"),
        Node(
            "F2",
            "Formatter, resumed: the conversion patch, when the citation style changes",
            "maybe",
        ),
        Node("CF", "Script: patches applied, compile, pandoc, the counts", "script"),
        Node("SO", REPLACE_STOP, "stop"),
        Node("X", "Formatted document"),
    )
    edges = (
        Edge("SQ", "ST", "a target that is not supported"),
        Edge("ST", "F"),
        Edge("SQ", "F"),
        Edge("CF", "SO", "an output already stands"),
        Edge("SO", "CF", "you confirm", "back"),
        Edge("F", "F2"),
        Edge("F", "CF"),
        Edge("F2", "CF"),
        Edge("CF", "X"),
    )
    return _graph(nodes, edges)


def paper_revision_coach_graph() -> Graph:
    nodes = (
        Node("R", "Revision coach: the comments parsed"),
        Node("Q", "You confirm the parsed comments", "stop"),
        Node("R2", "Revision coach, resumed: roadmap, tracking template, letter skeleton"),
    )
    edges = (
        Edge("R", "Q"),
        Edge("Q", "R", "a correction", "back"),
        Edge("Q", "R2"),
    )
    return _graph(nodes, edges)


def paper_rebuttal_audit_graph() -> Graph:
    nodes = (
        Node("R", "Revision coach, parsing only: the comments and your response draft"),
        Node("X", "Coverage per comment, gaps, risk flags; advisory, nothing verified"),
    )
    return _graph(nodes, (Edge("R", "X"),))


def paper_response_letter_graph() -> Graph:
    nodes = (
        Node("W", "Draft writer: response-letter.md beside the manuscript"),
        Node("P", "Peer reviewer: a verdict per point"),
        Node("X", "The letter and its check"),
    )
    return _graph(nodes, (Edge("W", "P"), Edge("P", "X")))


PAPER_MODES = (
    ("full", paper_full_graph),
    ("revision", paper_revision_graph),
    ("lit-review", paper_lit_review_graph),
    ("outline-only", paper_outline_only_graph),
    ("abstract-only", paper_abstract_only_graph),
    ("citation-check", paper_citation_check_graph),
    ("disclosure", paper_disclosure_graph),
    ("plan", paper_plan_graph),
    ("format-convert", paper_format_convert_graph),
    ("revision-coach", paper_revision_coach_graph),
    ("rebuttal-audit", paper_rebuttal_audit_graph),
    ("response-letter", paper_response_letter_graph),
)


def paper_figures() -> tuple[tuple[str, str], ...]:
    """The figure of each mode of the paper skill, as its file name and body."""
    return tuple(
        (f"paper/{mode}.svg", _paper(mode, mode, build()))
        for mode, build in PAPER_MODES
    )


def _lanes_label(title: str, rows: Sequence[Row]) -> str:
    """The text a lanes figure carries for a reader who cannot see it: each lane's boxes."""
    lanes = [
        f"{lane.caption}: " + "; ".join(node.label for node in lane.nodes)
        for row in rows
        for lane in row.lanes
    ]
    return f"{title}. " + " | ".join(lanes) + "."


LIFECYCLE_LEGEND = (
    Legend("agent", "Solid box: a part of the mode named above it, and the mode or call that runs that part alone"),
    Legend("maybe", "Dashed box: work the session does on request, with no mode behind it"),
)


def _flow_label(title: str, panels: Sequence[Panel]) -> str:
    """The text a flow of files carries for a reader who cannot see it: each hand-off."""
    parts = []
    for panel in panels:
        names = {
            node.key: node.label for node in (*panel.graph.nodes, *panel.graph.floating)
        }
        steps = [
            f"{names[edge.src]} to {names[edge.dst]}"
            + (f" ({edge.label})" if edge.label else "")
            for edge in panel.graph.edges
        ]
        prefix = f"{panel.caption}: " if panel.caption else ""
        parts.append(prefix + "; ".join(steps))
    return f"{title}. " + " | ".join(parts) + "."


def _parts(*labels: str, kind: str = "agent") -> tuple[Node, ...]:
    """A box per part of a mode, in the order the mode runs them."""
    return tuple(Node(f"p{index}", label, kind) for index, label in enumerate(labels))


def paper_lifecycle() -> str:
    plan = Lane(
        "/paper plan",
        _parts("Help me plan my paper: a chapter plan, worked out in a dialogue"),
    )
    full = Lane(
        "/paper full: one run does every part, in this order",
        _parts(
            "1. The literature search. Alone: /paper lit-review",
            "2. The outline. Alone: /paper outline-only",
            "3. The arguments and the draft. Only in full mode",
            "4. The figures. Alone: /paper figures, a call",
            "5. The citation check. Alone: /paper citation-check",
            "6. The abstract. Alone: /paper abstract-only",
            "7. The review of the draft. Alone: /paper draft-review, a call",
            "8. The format and the cover letter. Alone: /paper format-convert",
            "9. The AI disclosure statement. Alone: /paper disclosure",
        ),
        columns=3,
        node_width=218,
    )
    submit = Lane(
        "You submit: /submit",
        _parts(
            "Write the highlights",
            "Describe a graphical abstract",
            kind="maybe",
        ),
    )
    revision = Lane(
        "/paper revision: one run does every part, in this order",
        _parts(
            "1. The comments read into a list of items. Alone, as a roadmap: /paper revision-coach",
            "2. The manuscript revised, and the citations of the changes checked. Only in revision mode",
            "3. The response letter and its check, for referee comments. Alone: /paper response-letter",
        ),
        columns=3,
        node_width=218,
    )
    resubmit = Lane(
        "You resubmit: /submit",
        _parts("A response you wrote yourself, checked before you send it: /paper rebuttal-audit"),
    )
    internal = Lane(
        "Internal documents",
        _parts(
            "A record of every attempt, for my own reference: /paper full, outline-only or "
            "abstract-only, with the intake row Internal only set to yes",
            "An outline or a literature review to pass to my co-authors: /paper outline-only "
            "or /paper lit-review",
        ),
        columns=2,
        node_width=330,
    )
    rows = (
        Row("FROM A PLAN TO A SUBMITTED MANUSCRIPT", (plan, full, submit)),
        Row("WHEN THE JOURNAL'S COMMENTS COME BACK", (revision, resubmit)),
        Row("DOCUMENTS THAT ARE NOT SUBMITTED", (internal,), arrows=False),
    )
    note = (
        "Full mode's intake offers the latest plan run (chapter-plan.md, insights.md, "
        "dialogue.md) and the latest lit-review run (review.md, refs.bib), so work done alone "
        "is not done twice. An outline-only run also makes the literature search. Format-convert "
        "also formats a manuscript for another journal. A revision on an editor's comments "
        "writes no response letter."
    )
    label = _lanes_label("The path of a manuscript through the modes of the paper skill", rows)
    return lanes_figure("paper/lifecycle.svg", label, rows, LIFECYCLE_LEGEND, note)


RUN_FOLDER_LEGEND = (
    Legend("agent", "Solid box: an agent of the run"),
    Legend("script", "Grey box: a script the session runs"),
    Legend("choice", "Rounded box: a folder, with the files that end up in it"),
)


def paper_run_folder() -> str:
    run = (
        Node("I", "Intake agent"),
        Node("S", "Literature strategist"),
        Node("A", "Structure architect"),
        Node("B", "Argument builder"),
        Node("W", "Draft writer"),
        Node("V", "Visualization agent"),
        Node("C", "Citation compliance agent"),
        Node("AB", "Abstract agent"),
        Node("R", "Peer reviewer"),
        Node("F", "Formatter"),
        Node("M", "The manuscript's folder: main.tex, refs.bib, figures/, the PDF and the other targets", "choice"),
    )
    run_edges = (
        Edge("I", "S", "config.md"),
        Edge("S", "A", "review.md, refs.bib"),
        Edge("A", "B", "outline.md"),
        Edge("B", "W", "arguments.md"),
        Edge("B", "V", "arguments.md"),
        Edge("W", "C", "main.tex, intended-claims.md, draft-report.md"),
        Edge("W", "AB", "main.tex"),
        Edge("V", "R", "figures/, figures.md, a patch"),
        Edge("C", "R", "citation-report.md, patches"),
        Edge("AB", "R", "a patch"),
        Edge("R", "F", "review-<r>.md"),
        Edge("F", "M", "format-report.md, patches"),
    )
    patch = (
        Node("PA", "An agent"),
        Node("PS", "Script: the patch applied to the file by its block hashes", "script"),
        Node("PM", "The manuscript's folder: the changed file", "choice"),
        Node("PP", "patches/ in the run folder: the manifest, the patch, the patched file and the apply report", "choice"),
    )
    patch_edges = (
        Edge("PA", "PS", "<nn>-<file name>.patch.json"),
        Edge("PS", "PM", "the patched file"),
        Edge("PS", "PP", "the four files of the patch"),
    )
    panels = [
        Panel("A FULL RUN: EACH AGENT AND THE FILES IT HANDS ON", _graph(run, run_edges)),
        Panel("EVERY CHANGE AFTER THE FIRST DRAFT IS A PATCH", _graph(patch, patch_edges)),
    ]
    note = (
        "Every file named on an arrow stays in the run folder, paper-runs/<mode>-<date>/ "
        "beside the manuscript's folder, with config.md, checks.md and final.md; main.tex, "
        "refs.bib and figures/ stand in the manuscript's folder. The other modes run a part of "
        "this flow: outline-only ends at outline.md, lit-review at review.md and refs.bib, "
        "abstract-only, citation-check and format-convert start one agent on a manuscript given, "
        "and revision runs the peer reviewer, the draft writer and the citation compliance "
        "agent on the comments, leaving items.md, revision-log.md and review-2.md."
    )
    label = _flow_label("The files of a full run of the paper skill, from agent to agent", panels)
    return compose("paper/run-folder.svg", label, panels, RUN_FOLDER_LEGEND, note)


def grill() -> str:
    nodes = (
        Node(
            "LA",
            "Lookup agent, when a decision needs a fact a file read does not give",
            "maybe",
        ),
        Node("SM", "A lookup agent served another model", "stop"),
        Node("R", "A round", "stop"),
        Node("E", "The end", "stop"),
    )
    edges = (
        Edge("LA", "SM", "served a model other than the configured one"),
        Edge("LA", "R", "the fact joins the next round"),
        Edge("R", "R", "until no decision is open", "back"),
        Edge("R", "E"),
    )
    note = (
        "Under --self-rule a round holds only the decisions of the six kinds and the end "
        "is not a stop."
    )
    return _single("grill.svg", "The grill skill", _graph(nodes, edges), note)


def writing() -> str:
    nodes = (
        Node("A", "Sentence agent"),
        Node("B", "Section agent"),
        Node("C", "Whole-draft agent"),
        Node("K", "Checking agent"),
        Node("RP", "The end: the numbered report"),
    )
    edges = (
        Edge("A", "K"),
        Edge("B", "K"),
        Edge("C", "K"),
        Edge("K", "RP"),
    )
    note = "The three finding agents start at once; the checking agent starts after they end."
    return _single("writing.svg", "The writing skill", _graph(nodes, edges), note)


def paper_review_panel() -> str:
    """The full mode of the paper-review-panel skill: its agents in order and its two stops."""
    reviewers = (
        Node("E", "EIC, 2 calls"),
        Node("M", "Methodology reviewer, 2 calls"),
        Node("D", "Domain reviewer, 2 calls"),
        Node("P", "Perspective reviewer, 2 calls"),
        Node("A", "Devil's Advocate reviewer, 2 calls"),
    )
    nodes = (
        Node("F", "Field analyst: the Reviewer Configuration Card"),
        Node("C", "You confirm the reviewer configuration", "stop"),
        *reviewers,
        Node("S", "Editorial synthesizer: the Editorial Decision and the Revision Roadmap"),
        Node("Q", "EIC, resumed: the coaching question, only for a revision decision", "stop"),
    )
    edges = (
        Edge("F", "C"),
        *(Edge("C", reviewer.key) for reviewer in reviewers),
        *(Edge(reviewer.key, "S") for reviewer in reviewers),
        Edge("S", "Q", "Minor or Major Revision"),
        Edge("Q", "Q", "until the dialogue ends or you say just fix it", "back"),
    )
    note = (
        "The five reviewers start at once, each in 2 calls under the sprint contract. The "
        "other modes start these roles. Re-review: the field analyst, the EIC and the "
        "editorial synthesizer. Quick: the field analyst and the EIC. Methodology-focus: the "
        "field analyst, the EIC and the methodology reviewer. Guided: the field analyst and "
        "the five reviewers, then the EIC's dialogue. Calibration: all seven, 5 times per "
        "gold paper."
    )
    return _single(
        "paper-review-panel.svg",
        "The full mode of the paper-review-panel skill",
        _graph(nodes, edges),
        note,
    )


def referee() -> str:
    """The first round of the referee skill: its agents in order and its stops."""
    reviewers = (
        Node("E", "EIC, 2 calls"),
        Node("M", "Methodology reviewer, 2 calls"),
        Node("D", "Domain reviewer, 2 calls"),
        Node("P", "Perspective reviewer, 2 calls"),
        Node("A", "Devil's Advocate reviewer, 2 calls"),
    )
    nodes = (
        Node("I", "You answer the intake", "stop"),
        Node("F", "Field analyst: the Reviewer Configuration Card"),
        Node("C", "You confirm the reviewer configuration", "stop"),
        *reviewers,
        Node("R", "Referee: every point graded and ranked, and the left-out comments"),
        Node("K", "Rule check: the selection against the referee's rules"),
        Node("N", "Referee, resumed: the selected minor points in full", "maybe"),
        Node("J", "Rule check: the selected points in full", "maybe"),
        Node("S", "You confirm the selection or move comments", "stop"),
        Node("W", "Referee, resumed: the referee report"),
        Node("L", "Referee, resumed: the report shortened, only when over the length", "maybe"),
        Node("Q", "Rule check: the report against the referee's rules"),
        Node("B", "The breaks left in the report, only after 2 returns", "stop"),
    )
    edges = (
        Edge("I", "F"),
        Edge("F", "C"),
        *(Edge("C", reviewer.key) for reviewer in reviewers),
        *(Edge(reviewer.key, "R") for reviewer in reviewers),
        Edge("R", "K"),
        Edge("K", "R", "a break, at most 2 times", "back"),
        Edge("K", "N"),
        Edge("N", "J"),
        Edge("J", "N", "a break, at most 2 times", "back"),
        Edge("J", "S"),
        Edge("S", "W"),
        Edge("W", "L"),
        Edge("L", "Q"),
        Edge("Q", "W", "a break, at most 2 times", "back"),
        Edge("Q", "B", "a break still named"),
    )
    note = (
        "The five reviewers start at once from the pages of the paper-review-panel skill, "
        "each in 2 calls under its sprint contract. A panel shrunk at the intake starts only "
        "the reviewers you name. The session keeps the budget: it moves the points over it "
        "out of the referee's ranking and counts the words of the report, and no agent is "
        "given a number of it. A change you make at the selection that needs new text goes "
        "to the referee and its rule check again. The second round starts the field analyst, "
        "the five reviewers only when you ask for them at the intake, the EIC, which checks "
        "the revision against the authors' response, and a new-issue agent with a rule check "
        "of its own when the EIC wrote a new issue. Its selection, its stops and its report "
        "follow as in the first round. A plain request that does not say the round is asked "
        "which round it is."
    )
    return _single(
        "referee.svg",
        "The first round of the referee skill",
        _graph(nodes, edges),
        note,
    )


def _integrity_check(
    stage: str, depth: str, agent: str, done: str, fail: str
) -> tuple[
    tuple[Node, ...], tuple[Edge, ...]
]:
    """The boxes and arrows of one integrity check of the researcher skill, at one stage."""
    k = stage.replace(".", "")
    nodes = (
        Node(f"I{k}", f"{agent}, Stage {stage}: {depth}, the ethics check last"),
        Node(f"C{k}", f"Compliance agent, Stage {stage}"),
        Node(f"B{k}", "A failure-mode block, a compliance block, or a BLOCKED or CONDITIONAL ethics verdict", "stop"),
        Node(f"F{k}", "A FAIL: the correction list to confirm", "stop"),
        Node(f"V{k}", "/paper revision: the correction round", "paper"),
        Node(f"T{k}", "The third correction round failed: you decide", "stop"),
        Node(f"K{k}", f"The checkpoint after Stage {stage}", "stop"),
    )
    edges = (
        Edge(f"I{k}", f"C{k}"),
        Edge(f"C{k}", f"B{k}", "a stop of the check"),
        Edge(f"C{k}", f"F{k}", fail),
        Edge(f"C{k}", f"K{k}", done),
        Edge(f"B{k}", f"V{k}", "a fix, a backfill or an addendum"),
        Edge(f"F{k}", f"V{k}"),
        Edge(f"V{k}", f"I{k}", "the check again, at most 3 rounds", "back"),
        Edge(f"V{k}", f"T{k}", "not passed after 3 rounds"),
    )
    return nodes, edges


def researcher() -> str:
    """The manuscript mode of the researcher skill: its stages, agents, runs and stops."""
    first, first_edges = _integrity_check(
        "2.5", "the sampled depth", "Integrity agent", "PASS", "FAIL"
    )
    final, final_edges = _integrity_check(
        "4.5",
        "the full depth",
        "A fresh integrity agent",
        "PASS with zero issues",
        "FAIL, or PASS WITH NOTES",
    )
    nodes = (
        Node("X", "The record of the experiments, when the project holds none", "stop"),
        Node("G", "You confirm the run's configuration and its budget", "stop"),
        Node("W", "/paper full: the draft, Stage 2", "paper"),
        Node("K2", "The checkpoint after Stage 2", "stop"),
        *first,
        Node("P", "/paper-review-panel full: the review, Stage 3", "paper"),
        Node("D", "The review decision", "stop"),
        Node("R", "/paper revision: the revision, Stage 4", "paper"),
        Node("K4", "The checkpoint after Stage 4", "stop"),
        Node("Q", "/paper-review-panel re-review: the re-review, Stage 3'", "paper"),
        Node("S", "A regression, or the early-stopping suggestion, from the score deltas", "stop"),
        Node("E", "The re-review decision", "stop"),
        Node("M", "/paper revision: the minor items of a Minor decision, once", "paper"),
        Node("Y", "/paper revision: the re-revision, Stage 4', once", "paper"),
        Node("K4b", "The checkpoint after Stage 4'", "stop"),
        *final,
    )
    edges = (
        Edge("X", "G"),
        Edge("G", "W"),
        Edge("W", "K2"),
        Edge("K2", "I25"),
        *first_edges,
        Edge("K25", "P"),
        Edge("P", "D"),
        Edge("D", "W", "Reject, your choice: Stage 2 again", "back"),
        Edge("D", "R", "Minor or Major Revision"),
        Edge("D", "I45", "Accept"),
        Edge("R", "K4"),
        Edge("K4", "Q"),
        Edge("Q", "S"),
        Edge("S", "E"),
        Edge("E", "Y", "Major"),
        Edge("E", "M", "Minor"),
        Edge("M", "I45"),
        Edge("E", "I45", "Accept"),
        Edge("Y", "K4b"),
        Edge("K4b", "I45"),
        *final_edges,
    )
    note = (
        "integrity runs one check alone: the integrity agent at the full depth, or with "
        "pre-review at the sampled depth, then the compliance agent, the same blocks and at "
        "most 3 correction rounds through /paper revision, and the run ends. A draft given "
        "to manuscript enters at Stage 2.5. With a comments file it goes from Stage 2.5 to "
        "Stage 4 with the comments, then to the session's completeness check in place of the "
        "re-review, a stop, and to Stage 4.5. Each run of paper and paper-review-panel is invoked "
        "through the Skill tool with its own stops, which are not drawn. The session holds "
        "every checkpoint and writes the run's state and the Material Passport. Each "
        "integrity record and each compliance report is a file of the run folder."
    )
    return _single(
        "researcher.svg",
        "The manuscript mode of the researcher skill",
        _graph(nodes, edges),
        note,
        (
            *SIMPLE_LEGEND,
            Legend("paper", "Teal box: a run of the paper or paper-review-panel skill"),
        ),
    )


def submit() -> str:
    """The submit skill: its agent and its stops, from the sheet to the page of the final submit."""
    nodes = (
        Node("S", "Sheet agent: the submission sheet from your folder and the public instructions"),
        Node("X", "Nothing from the folder in the sheet: the run ends with what was found", "stop"),
        Node("A", "You approve the sheet, correct it or answer its questions", "stop"),
        Node("E", "The extension not connected: the run ends with the sheet", "stop"),
        Node("L", "A field the sheet lacks, added to it as a question", "stop"),
        Node("C", "A sign-in, a licence, a copyright transfer, a consent or a payment that blocks a page", "stop"),
        Node("N", "A page that does not pass: the portal's message, with its row", "stop"),
        Node("P", "The page of the final submit: you press it", "stop"),
    )
    edges = (
        Edge("S", "X", "nothing from the folder"),
        Edge("S", "A"),
        Edge("A", "E", "no extension"),
        Edge("A", "L", "the walk, page by page"),
        Edge("L", "C"),
        Edge("C", "N"),
        Edge("N", "P"),
    )
    note = (
        "The session walks the portal's forms in the browser extension after your approval: "
        "it fills each field, uploads each file and answers each declaration as the sheet "
        "says, and reads each page back against it. A field the sheet lacks, a control left "
        "to you and a page that does not pass stop a page only when the page has one. The "
        "agent reads your folder, the portal's public pages it saves with curl, the journal "
        "guide of paper and the funder config of grant, and the sheet's first lines say how "
        "much of the portal's form it could read before a sign-in. Before the agent starts, "
        "the run stops when a run folder of the same date stands, and when the folder holds "
        "several funder configs. The session never types a password and never presses the "
        "final submit."
    )
    return _single(
        "submit.svg",
        "The submit skill",
        _graph(nodes, edges),
        note,
    )


def grant() -> str:
    """The draft mode of the grant skill: its agents in order and its stops."""
    nodes = (
        Node("I", "Intake agent: the questions of the grant intake"),
        Node("A", "You answer the intake", "stop"),
        Node("S", "Structure architect: the outline, in the funder's sections"),
        Node("O", "You confirm the outline", "stop"),
        Node("B", "Argument builder: each section's argument for the criteria"),
        Node("W", "Draft writer: the application's .tex, or a patch of a section"),
        Node("C", "Citation compliance: each cited claim, only with a .bib", "maybe"),
        Node("F", "Formatter: the layout of the funder config, only when it states one", "maybe"),
        Node("L", "Draft writer, resumed: content cut once, when the compile is over the page limit", "maybe"),
        Node("V", "You pick the writing findings to apply", "stop"),
        Node("P", "Draft writer, resumed: the picked findings as one patch", "maybe"),
    )
    edges = (
        Edge("I", "A"),
        Edge("A", "S"),
        Edge("S", "O"),
        Edge("O", "S", "a correction", "back"),
        Edge("O", "B"),
        Edge("B", "W"),
        Edge("W", "C"),
        Edge("C", "F"),
        Edge("F", "L"),
        Edge("L", "V"),
        Edge("V", "P"),
    )
    note = (
        "Each of the six roles runs from its page of the paper skill, given the funder "
        "config and the session's direction. The session counts the application's pages "
        "before the draft, applies each patch, compiles the application with the engine the "
        "application itself uses and runs check_sections.py and check_limits.py before the "
        "writing review and again after the cut and after the review's patch. A draft of one "
        "section is checked and "
        "reviewed on that section. The run asks which config when the "
        "application's folder holds several, asks the mode of a plain request that names "
        "none, and passes on a stop of the paper skill. A draft of a form field starts the "
        "intake agent and the draft writer only, which writes the field's text into "
        "grant-fields.md. The config mode starts the config "
        "drafter and shows you its draft to confirm; for a file of form-field texts you name "
        "it asks before it replaces a grant-fields.md that exists, starts the field texts "
        "agent when the file is in another format, and shows you the form fields to confirm. "
        "The revise mode starts the draft writer "
        "on a comments file and ends with the same cut and the same writing review. The "
        "review mode compiles "
        "the application and starts the criteria reviewer, which scores it per criterion "
        "and changes nothing. The check mode starts no agent: it compiles and runs the two scripts."
    )
    return _single(
        "grant.svg",
        "The draft mode of the grant skill",
        _graph(nodes, edges),
        note,
    )


def code_comments() -> str:
    nodes = (
        Node("F", "Finding agent"),
        Node("K", "Checking agent"),
        Node("RP", "The end: the report of the comments that break a rule"),
        Node("RW", "Rewrite agent, when you type apply", "maybe"),
    )
    edges = (
        Edge("F", "K"),
        Edge("K", "RP"),
        Edge("RP", "RW", "apply <numbers> or apply all"),
    )
    note = "A rewrite is kept only when the code of the file compares equal to its code before."
    return _single(
        "code-comments.svg",
        "The code-comments skill",
        _graph(nodes, edges),
        note,
    )


def codebase_design() -> str:
    """The standards mode and the review mode of the codebase-design skill, side by side."""
    standards = (
        Node("D", "The draft", "stop"),
        Node("W", "The end: the additions you approved, written"),
    )
    review = (
        Node("S", "Scan agent: the code against the standards pages"),
        Node("C", "The candidates", "stop"),
        Node(
            "A",
            "Design agents, three or more at once, when you ask for other interfaces",
            "maybe",
        ),
        Node("E", "The end: /roadmap add and /grill write the picked candidate as a roadmap entry"),
        Node(
            "O",
            "The ADR offer, only for a candidate you reject for a reason a later review needs",
            "stop",
        ),
    )
    review_edges = (
        Edge("S", "C", "the report of the candidates, opened"),
        Edge("C", "A", "you ask for other interfaces"),
        Edge("C", "E"),
        Edge("A", "E"),
        Edge("C", "O", "you reject a candidate"),
    )
    panels = [
        Panel("THE STANDARDS MODE", _graph(standards, (Edge("D", "W"),))),
        Panel("THE REVIEW MODE", _graph(review, review_edges)),
    ]
    note = (
        "The standards mode starts no agent. Either mode reads the repository's pages and then "
        "asks once whether the repository has a user interface, unless a page holds a UI "
        "standard or the repository tracks a .svelte file. In a repository with no plan "
        "configuration the review mode invokes /ordo-init before /roadmap add. The skills it "
        "invokes have their own stops. The call with no mode starts the design agents only "
        "when you ask for other interfaces."
    )
    return compose(
        "codebase-design.svg",
        describe("The codebase-design skill", panels),
        panels,
        SIMPLE_LEGEND,
        note,
    )


def plan_loop() -> str:
    spec = Lane(
        "/spec",
        (
            Node("a", "Brief-check agent, for a full step", "maybe"),
            Node("b", "Diagnosis agent, for a part that asks for a cause", "maybe"),
            Node("c", "A false premise the plan cannot absorb", "stop"),
            Node("d", "A rule clash with an ADR", "stop"),
            Node("e", "A user-visible choice", "stop"),
            Node("f", "A brief check finding the brief cannot absorb", "stop"),
            Node("g", "A cause not found", "stop"),
            Node("h", MODEL, "stop"),
            Node("i", "A step that does not converge", "stop"),
        ),
        columns=2,
    )
    build = Lane(
        "build it",
        (
            Node(
                "a",
                "Builder agent, unless the executor is inline or academic-paper",
                "maybe",
            ),
        ),
    )
    refute = Lane(
        "/refute",
        (Node("a", "Reviewer agent"), Node("b", MODEL, "stop")),
    )
    close = Lane(
        "close them",
        (
            Node("a", "Builder agent: a repair round of a full step", "maybe"),
            Node(
                "b", "Diagnosis agent, for a finding whose cause is not known", "maybe"
            ),
        ),
    )
    again = Lane(
        "/refute over the round",
        (
            Node("a", "Reviewer agent, when refute_after_repair is yes", "maybe"),
            Node("b", MODEL, "stop"),
        ),
    )
    land = Lane(
        "/land",
        (
            Node("a", "A red line for the user", "stop"),
            Node("b", "A rule clash", "stop"),
            Node("c", "A lock held", "stop"),
            Node("d", "A worktree that cannot be removed", "stop"),
        ),
    )
    orchestration = Lane(
        "/plan-orchestration [<entry>]: runs the row above for every step, unattended",
        (
            Node("a", "A shape nobody named", "stop"),
            Node("b", "A wrong premise", "stop"),
            Node("c", "A red check", "stop"),
            Node("d", "A rule clash", "stop"),
            Node("e", "A finding that is the user's", "stop"),
            Node("f", "The roadmap diff", "stop"),
            Node("g", MODEL, "stop"),
        ),
        columns=4,
    )
    rows = (
        Row(
            "FOR EVERY STEP, IN ORDER; RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW",
            (spec, build, refute, close, again, land),
            returns=((4, 3, "a further round, within repair_rounds"),),
        ),
        Row("RUNNING THE ROW UNATTENDED, OPTIONAL", (orchestration,), arrows=False),
    )
    boxes = [n.label for row in rows for lane in row.lanes for n in lane.nodes]
    label = (
        "The loop of one step, lane by lane in order: "
        + "; ".join(f"{lane.caption}" for row in rows for lane in row.lanes)
        + ". Boxes: "
        + "; ".join(boxes)
        + "."
    )
    note = (
        "/ordo-help starts no agent and has no stop. /land starts no agent. A refusal names "
        "its cause and leaves nothing, so it is not drawn."
    )
    return lanes_figure("plan-loop.svg", label, rows, SIMPLE_LEGEND, note)


def pipeline() -> str:
    init = Lane(
        "/ordo-init",
        (
            Node("a", "The questions", "stop"),
            Node("b", "The draft of the tree", "stop"),
            Node("c", "Several roadmaps", "stop"),
            Node("d", "Worker, reviewer and libraries", "stop"),
            Node("e", "A failing command", "stop"),
            Node("f", "The draft of the configuration", "stop"),
            Node("g", "Another utils/build.py", "stop"),
            Node("h", "The draft of the driver", "stop"),
            Node("i", "A command that does not read back", "stop"),
            Node("j", "A fix in the configuration check", "stop"),
            Node("k", "A hunk to rule on", "stop"),
            Node("l", "The drafted sync change", "stop"),
            Node("m", "A file sync cannot use", "stop"),
            Node("n", "The sync still fails", "stop"),
            Node("o", "No commit allowed", "stop"),
        ),
        columns=4,
    )
    roadmap = Lane(
        "/roadmap add",
        (
            Node("a", "The change", "stop"),
            Node("b", "No gate", "stop"),
            Node("c", "The level", "stop"),
            Node("d", "The insertion form", "stop"),
            Node("e", "A missing dependency", "stop"),
        ),
    )
    grill_lane = Lane(
        "/grill <entry>",
        (
            Node("a", "Lookup agent, when a fact needs it", "maybe"),
            Node("b", "A round", "stop"),
            Node("c", "The end", "stop"),
            Node("d", "A lookup agent served another model", "stop"),
        ),
    )
    plan = Lane(
        "/plan <entry>",
        (
            Node("a", "A gate with no count", "stop"),
            Node("b", "The drafted step list", "stop"),
        ),
    )
    step = Lane(
        "every step",
        (
            Node(
                "a",
                "The loop of plan-loop.svg: /spec, build it, /refute, /land",
                "agent",
            ),
        ),
    )
    closing = Lane("/roadmap done <entry>", (Node("a", "The change", "stop"),))
    plan_retro = Lane("/plan-retro", (Node("a", "The proposals", "stop"),))
    session_retro = Lane(
        "/session-retro",
        (Node("a", "A large output", "stop"), Node("b", "The proposals", "stop")),
    )
    diagnose = Lane(
        "/diagnose",
        (
            Node("a", "Diagnosis agent, when run in a plan's loop", "maybe"),
            Node("b", "The hypotheses", "stop"),
            Node("c", "No red command", "stop"),
            Node("d", "A red command a person drives", "stop"),
            Node("e", "Not enough output after redaction", "stop"),
            Node("f", "The cause not found", "stop"),
        ),
    )
    rows = (
        Row(
            "SET THE REPOSITORY UP, ONCE",
            (init,),
            arrows=False,
        ),
        Row(
            "FOR EACH ROADMAP ENTRY, IN ORDER",
            (roadmap, grill_lane, plan, step, closing),
        ),
        Row(
            "AFTER PLANS HAVE RUN, AND AT ANY POINT",
            (plan_retro, session_retro, diagnose),
            arrows=False,
        ),
    )
    boxes = [n.label for row in rows for lane in row.lanes for n in lane.nodes]
    label = (
        "The pipeline of one roadmap entry, lane by lane: "
        + "; ".join(lane.caption for row in rows for lane in row.lanes)
        + ". Boxes: "
        + "; ".join(boxes)
        + "."
    )
    note = (
        "These start no agent: /ordo-init, /roadmap, /plan, /land, /plan-retro, "
        "/session-retro, /wizard, /tutor, and /wait-what and /ordo-help, which have no stop. A refusal names "
        "its cause and leaves nothing, so it is not drawn."
    )
    return lanes_figure("pipeline.svg", label, rows, SIMPLE_LEGEND, note)


def figures() -> tuple[tuple[str, str], ...]:
    """Every figure of this script, as the file name under docs/figures and its body."""
    return (
        ("pipeline.svg", pipeline()),
        ("plan-loop.svg", plan_loop()),
        ("grill.svg", grill()),
        ("writing.svg", writing()),
        ("paper-review-panel.svg", paper_review_panel()),
        ("referee.svg", referee()),
        ("submit.svg", submit()),
        ("grant.svg", grant()),
        ("code-comments.svg", code_comments()),
        ("codebase-design.svg", codebase_design()),
        ("researcher.svg", researcher()),
        *paper_figures(),
        ("paper/lifecycle.svg", paper_lifecycle()),
        ("paper/run-folder.svg", paper_run_folder()),
    )


def write_figures(base: Path, figures_to_write: Sequence[tuple[str, str]]) -> list[str]:
    """Check every body, then write each file and read it back; return one line per file."""
    for name, body in figures_to_write:
        if not body.isascii():
            raise FigureError(f"{name}: the body holds a character that is not ASCII")
    lines: list[str] = []
    for name, body in figures_to_write:
        path = base / name
        try:
            path.parent.mkdir(parents=True, exist_ok=True)
            with path.open("w", encoding="utf-8", newline="\n") as handle:
                handle.write(body)
            written = path.read_text(encoding="utf-8")
        except OSError as error:
            raise FigureError(f"{name}: {error}") from error
        if written != body:
            raise FigureError(
                f"{name}: the text read back differs from the body written"
            )
        lines.append(f"wrote {path.relative_to(ROOT).as_posix()} ({len(body)} bytes)")
    return lines


def main() -> int:
    try:
        lines = write_figures(HERE, figures())
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
