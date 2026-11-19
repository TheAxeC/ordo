"""Write the SVG figures of the README: the runs of the skills that start agents.

Writes, beside this file:

- pipeline.svg: the commands of one roadmap entry in order, with the agents they start and the
  stops that wait on the user.
- plan-loop.svg: the commands of one step, /spec, build it, /refute, close them, /refute over
  the round and /land, with the /plan-orchestration band.
- grill.svg, writing.svg, code-comments.svg: the agents, stops and cycles of each skill.
- paper/full.svg, paper/revision.svg, paper/lit-review.svg, paper/outline-only.svg,
  paper/abstract-only.svg, paper/citation-check.svg, paper/disclosure.svg, paper/plan.svg,
  paper/format-convert.svg: one figure per mode of the paper skill.

Every figure shows the order of the run. An agent start is a box, solid when it always runs and
dashed when it runs only when needed. A stop that waits on the user is an orange box. A cycle is a
dotted arrow with its cap, and a check an agent repeats inside one start is a dotted loop on that
agent with its cap. Scripts and the session's own steps are left out, except where a paper figure
draws them: a script the session runs is a grey box, and a step where the session reads and
judges is a rounded box, each with its legend line.

Every box, arrow and label is written in this file, taken from each skill's SKILL.md and Stops
table; the script reads no skill file and no other input. A change to a Stops table, to a skill's
agents, its cycles or its name is made in the labels below, and the script is run again.

This file is also the layout code of gen_comparison.py, which imports it from its own folder's
parent.

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
    Legend("agent", "Solid box: an agent start that always runs"),
    Legend("maybe", "Dashed box: an agent start that runs only when needed"),
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


LANE_NODE_WIDTH = 196
LANE_PAD = 10
LANE_HEAD = 26
LANE_GAP = 26


class _LaneBox(NamedTuple):
    frame: Rect
    cells: list[tuple[Rect, Node, list[str]]]


def _lane_box(figure: str, lane: Lane, x: float, y: float) -> _LaneBox:
    width = lane.columns * LANE_NODE_WIDTH + (lane.columns + 1) * LANE_PAD
    cells = []
    cursor = y + LANE_HEAD
    for start in range(0, len(lane.nodes), lane.columns):
        row = lane.nodes[start : start + lane.columns]
        lines = [
            _wrap(
                figure,
                f"box {node.key!r}",
                node.label,
                LANE_NODE_WIDTH - 2 * PAD_X,
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
            left = x + LANE_PAD + column * (LANE_NODE_WIDTH + LANE_PAD)
            cells.append((Rect(left, cursor, LANE_NODE_WIDTH, height), node, wrapped))
        cursor += height + LANE_PAD
    frame = Rect(x, y, width, cursor - y)
    return _LaneBox(frame, cells)


def _lane_width(lane: Lane) -> float:
    return lane.columns * LANE_NODE_WIDTH + (lane.columns + 1) * LANE_PAD


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


def _paper(name: str, mode: str, graph: Graph) -> str:
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


THEME_RUN_FIRST = "Literature strategist, theme run: search theme 1"
THEME_RUN_REST = "Literature strategist, theme runs: each other search theme, all at once"
MERGE_RUN = (
    "Literature strategist, merge run, after the theme runs: removes the duplicates, "
    "assesses the sources the theme runs hand on, searches where the search themes meet, "
    "runs the quality gates, writes the one review"
)
THEME_EDGE = "two search themes or more, unless you skip the search"
MERGE_LOOP = "an open citation loop: a backward and a forward round; a failed gate: a search"
SEARCH_LOOP = "search rounds: 3 of 5 stopping rules, or 4 rounds with none"
CONFIRMED = "each source confirmed by a live lookup"


def paper_full_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node(
            "L",
            "Literature strategist, unless you skip it; " + CONFIRMED,
            "maybe",
        ),
        Node("T1", THEME_RUN_FIRST, "maybe"),
        Node("T2", THEME_RUN_REST, "maybe"),
        Node("M", MERGE_RUN, "maybe"),
        Node("LR", "You review the sources, optional", "stop"),
        Node("PL", "Planner"),
        Node(
            "SQ",
            "A research question the materials do not answer, when a part has no result",
            "stop",
        ),
        Node("G", "Literature strategist: the sections with no source", "maybe"),
        Node("PL2", "Planner: assigns what was found", "maybe"),
        Node(
            "PW",
            "Planner, fresh: rewrites each argument with two or more weak-argument signs",
            "maybe",
        ),
        Node("OA", "Outline approval: each rewritten argument before and after", "stop"),
        Node("W", "Draft writer"),
        Node(
            "WM",
            "Draft writer once more: the model identifier, when the model list gave none or the served one differs",
            "maybe",
        ),
        Node("V", "Visualization, with data", "maybe"),
        Node("C", "Citation compliance"),
        Node("C2", "Citation compliance once more, when a check fails", "maybe"),
        Node(
            "SC",
            "A claim the run cannot support, or a reference that cannot be confirmed",
            "stop",
        ),
        Node(
            "SS",
            "The citation style to confirm, when more than half the entries fail the same check",
            "stop",
        ),
        Node("P", "Peer reviewer"),
        Node("WR", "Draft writer: a patch"),
        Node(
            "IC",
            "Citation compliance for each later patch with a cited sentence: those "
            "sentences only",
            "maybe",
        ),
        Node("SJ", "The draft review rejects the draft: each Critical issue classed, a roadmap", "stop"),
        Node("SD", "The draft review does not pass: no answer recommended", "stop"),
        Node("RF", "Draft writer: reference fix", "maybe"),
        Node("SR", "A reference that cannot be confirmed", "stop"),
        Node("CF", "Draft writer: compile fix", "maybe"),
        Node("WG", "/writing: 4 agents, unless you said no at intake", "maybe"),
        Node("RP", "End: the final message, with the /writing report and your reply, optional"),
        Node("WA", "Draft writer: applies what you pick", "maybe"),
        Node("IC2", "Citation compliance: the sentences of the findings pass", "maybe"),
        Node("PR", "Peer reviewer: reads the findings pass", "maybe"),
        Node("CF2", "Draft writer: compile fix", "maybe"),
        Node(
            "AN", "Draft writer: the anonymous copy, for a double-blind venue", "maybe"
        ),
        Node("FT", "Formatter: the DOCX and Markdown targets you named", "maybe"),
    )
    edges = (
        Edge("I", "L", "one search theme"),
        Edge("I", "T1", THEME_EDGE),
        Edge("I", "T2"),
        Edge("L", "LR"),
        Edge("L", "L", SEARCH_LOOP, "back"),
        Edge("T1", "T1", SEARCH_LOOP, "back"),
        Edge("T2", "T2", SEARCH_LOOP, "back"),
        Edge("T1", "M"),
        Edge("T2", "M"),
        Edge("M", "M", MERGE_LOOP, "back"),
        Edge("M", "LR"),
        Edge("LR", "PL"),
        Edge("PL", "G", "a section has no source"),
        Edge("PL", "SQ"),
        Edge("SQ", "PL", "a fresh start with your answer", "back"),
        Edge("PL", "OA"),
        Edge("PL", "PW", "two or more weak-argument signs"),
        Edge("PW", "OA"),
        Edge("G", "PL2"),
        Edge("G", "G", SEARCH_LOOP, "back"),
        Edge("PL2", "OA"),
        Edge("OA", "PL", "changes or another structure, no cap", "back"),
        Edge("OA", "W"),
        Edge("OA", "V"),
        Edge("V", "V", "checks the rendered figure, up to 2 fixes, optional", "back"),
        Edge("W", "C"),
        Edge("W", "WM"),
        Edge("WM", "C"),
        Edge("V", "C"),
        Edge("C", "SC", "after every claim is judged: each claim not held, or a reference that fails"),
        Edge("C", "SS"),
        Edge("SS", "C", "a fresh start, once", "back"),
        Edge("C", "C2"),
        Edge("C", "P"),
        Edge("C2", "P"),
        Edge("P", "WR", "Minor or Major: round 2, once", "dotted"),
        Edge("WR", "IC"),
        Edge("IC", "P", "", "back"),
        Edge("P", "SJ", "Reject in round 1"),
        Edge("SJ", "WR", "fixable: a Major Revision pass, after you confirm", "dotted"),
        Edge("SJ", "PL", "structural: back to the outline, after you confirm", "back"),
        Edge("SJ", "I", "fundamental: back to intake, after you confirm", "back"),
        Edge("P", "SD", "after round 2: a score under 6.5 with a Critical issue open"),
        Edge("SD", "P", "revise by hand, or a lower venue: a fresh review", "back"),
        Edge(
            "SD",
            "PL",
            "an expanded revision, only when you choose it, from the step the cause names",
            "back",
        ),
        Edge("P", "RF"),
        Edge("SD", "RF", "accept"),
        Edge("RF", "SR", "strict: a reference still fails"),
        Edge("RF", "CF"),
        Edge("CF", "WG"),
        Edge("WG", "RP"),
        Edge("CF", "RP", "no /writing review"),
        Edge("RP", "WA"),
        Edge("WA", "IC2"),
        Edge("IC2", "PR"),
        Edge("PR", "CF2"),
        Edge("RP", "AN"),
        Edge("CF2", "AN"),
        Edge("RP", "FT"),
        Edge("CF2", "FT"),
    )
    return _graph(nodes, edges)


def paper_revision_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node(
            "P",
            "Peer reviewer: the instructions as items, or, with none, a review of the "
            "manuscript",
        ),
        Node(
            "SQ",
            "A research question the materials do not answer, when an item names a part",
            "stop",
        ),
        Node("IA", "You approve the items, with no instructions", "stop"),
        Node("LS", "Literature strategist, for a new reference", "maybe"),
        Node("V", "Visualization, for a figure", "maybe"),
        Node("W", "Draft writer: a patch per item"),
        Node("C", "Citation compliance"),
        Node("C2", "Citation compliance once more, when a check fails", "maybe"),
        Node(
            "SC",
            "A claim the run cannot support, or a reference that cannot be confirmed",
            "stop",
        ),
        Node(
            "SS",
            "The citation style to confirm, when more than half the entries fail the same check",
            "stop",
        ),
        Node("R", "Peer reviewer: reading"),
        Node("W2", "Draft writer: one pass"),
        Node(
            "IC",
            "Citation compliance for each later patch with a cited sentence: those "
            "sentences only",
            "maybe",
        ),
        Node("RF", "Draft writer: reference fix", "maybe"),
        Node("SD", "A reference that cannot be confirmed", "stop"),
        Node("CF", "Draft writer: compile fix", "maybe"),
        Node("WG", "/writing: 4 agents, unless you said no at intake", "maybe"),
        Node("RP", "End: the final message, with the /writing report and your reply, optional"),
        Node("WA", "Draft writer: applies what you pick", "maybe"),
        Node("IC2", "Citation compliance: the sentences of the findings pass", "maybe"),
        Node("PR", "Peer reviewer: reads the findings pass", "maybe"),
        Node("CF2", "Draft writer: compile fix", "maybe"),
        Node(
            "AN", "Draft writer: the anonymous copy, for a double-blind venue", "maybe"
        ),
    )
    edges = (
        Edge("I", "P"),
        Edge("P", "IA", "no instructions given"),
        Edge("P", "SQ", "an item names a part with no result"),
        Edge("SQ", "IA", "your answer, no instructions"),
        Edge("SQ", "W", "your answer, instructions given"),
        Edge("IA", "W"),
        Edge("P", "LS"),
        Edge("LS", "LS", SEARCH_LOOP, "back"),
        Edge("P", "V"),
        Edge("V", "V", "checks the rendered figure, up to 2 fixes, optional", "back"),
        Edge("P", "W"),
        Edge("LS", "W"),
        Edge("V", "W"),
        Edge("W", "C"),
        Edge("C", "SC", "after every claim is judged: each claim not held, or a reference that fails"),
        Edge("C", "SS"),
        Edge("SS", "C", "a fresh start, once", "back"),
        Edge("C", "C2"),
        Edge("C", "R"),
        Edge("C2", "R"),
        Edge("R", "W2", "items not resolved: reading 2, once", "dotted"),
        Edge("W2", "IC"),
        Edge("IC", "R", "", "back"),
        Edge("R", "RF"),
        Edge("RF", "SD", "strict: a reference still fails"),
        Edge("RF", "CF"),
        Edge("CF", "WG"),
        Edge("WG", "RP"),
        Edge("CF", "RP", "no /writing review"),
        Edge("RP", "WA"),
        Edge("WA", "IC2"),
        Edge("IC2", "PR"),
        Edge("PR", "CF2"),
        Edge("RP", "AN"),
        Edge("CF2", "AN"),
    )
    return _graph(nodes, edges)


def paper_lit_review_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("L", "Literature strategist: " + CONFIRMED, "maybe"),
        Node("T1", THEME_RUN_FIRST, "maybe"),
        Node("T2", THEME_RUN_REST, "maybe"),
        Node("SJ", "Session: each report read for work left undone", "choice"),
        Node("SC", "Script: each theme run's DOIs and arXiv IDs resolved", "script"),
        Node("L2", "Literature strategist, resumed with the identifier check: titles resolved, strict: a failing identifier corrected or removed", "maybe"),
        Node("M", MERGE_RUN, "maybe"),
        Node("MJ", "Session: the strategist's report read for work left undone", "choice"),
        Node("CK", "Script: every entry resolved, no identifier or title under two keys, the cited keys equal to the .bib's", "script"),
        Node("CJ", "Session: the exclusions read; one on a failed lookup is work left undone", "choice"),
        Node("LR", "You review the sources, optional", "stop"),
        Node("RC", "Script: each corrected or added entry's DOI or arXiv ID resolved again", "script"),
        Node("SR", "A reference that cannot be confirmed", "stop"),
        Node("F", "Formatter: each target other than Markdown, the review's issues back to the strategist", "maybe"),
    )
    edges = (
        Edge("I", "L", "one search theme"),
        Edge("I", "T1", "two search themes or more"),
        Edge("I", "T2"),
        Edge("L", "L", SEARCH_LOOP, "back"),
        Edge("T1", "T1", SEARCH_LOOP, "back"),
        Edge("T2", "T2", SEARCH_LOOP, "back"),
        Edge("L", "SJ"),
        Edge("T1", "SJ"),
        Edge("T2", "SJ"),
        Edge("SJ", "T2", "work left undone: sent back once", "back"),
        Edge("SJ", "SC"),
        Edge("SC", "L2", "one search theme"),
        Edge("SC", "M", "after theme runs: the same work, in the merge run"),
        Edge("M", "M", MERGE_LOOP, "back"),
        Edge("L2", "MJ"),
        Edge("M", "MJ"),
        Edge("MJ", "M", "work left undone: sent back once", "back"),
        Edge("MJ", "CK"),
        Edge("CK", "CJ"),
        Edge("CJ", "M", "a failure, or an exclusion on a failed lookup: sent back once", "back"),
        Edge("CJ", "LR"),
        Edge("LR", "RC"),
        Edge("RC", "SR", "strict: an identifier still fails"),
        Edge("RC", "F", "a target other than Markdown"),
    )
    return _graph(nodes, edges)


def paper_outline_only_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("L", "Literature strategist: " + CONFIRMED, "maybe"),
        Node("T1", THEME_RUN_FIRST, "maybe"),
        Node("T2", THEME_RUN_REST, "maybe"),
        Node("M", MERGE_RUN, "maybe"),
        Node("LR", "You review the sources, optional", "stop"),
        Node("PL", "Planner: outline and argument map"),
        Node("G", "Literature strategist: the sections with no source", "maybe"),
        Node("PL2", "Planner: assigns what was found", "maybe"),
        Node("OA", "Outline approval", "stop"),
    )
    edges = (
        Edge("I", "L", "one search theme"),
        Edge("I", "T1", "two search themes or more"),
        Edge("I", "T2"),
        Edge("L", "LR"),
        Edge("L", "L", SEARCH_LOOP, "back"),
        Edge("T1", "T1", SEARCH_LOOP, "back"),
        Edge("T2", "T2", SEARCH_LOOP, "back"),
        Edge("T1", "M"),
        Edge("T2", "M"),
        Edge("M", "M", MERGE_LOOP, "back"),
        Edge("M", "LR"),
        Edge("LR", "PL"),
        Edge("PL", "G", "a section has no source"),
        Edge("PL", "OA"),
        Edge("G", "PL2"),
        Edge("G", "G", SEARCH_LOOP, "back"),
        Edge("PL2", "OA"),
        Edge("OA", "PL", "changes or another structure, no cap", "back"),
    )
    return _graph(nodes, edges)


def paper_abstract_only_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("W", "Draft writer: the abstract"),
    )
    return _graph(nodes, (Edge("I", "W"),))


def paper_citation_check_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("C", "Citation compliance"),
        Node("C2", "Citation compliance once more, when a check fails", "maybe"),
        Node(
            "SD",
            "A claim the run cannot support, or a reference that cannot be confirmed",
            "stop",
        ),
        Node(
            "SS",
            "The citation style to confirm, when more than half the entries fail the same check",
            "stop",
        ),
        Node("X", "Citation report"),
    )
    edges = (
        Edge("I", "C"),
        Edge("C", "SS"),
        Edge("SS", "C", "a fresh start, once", "back"),
        Edge(
            "C",
            "SD",
            "a claim the source does not hold, or a reference no lookup confirms",
        ),
        Edge("C", "C2"),
        Edge("C2", "X"),
    )
    return _graph(nodes, edges)


def paper_disclosure_graph() -> Graph:
    nodes = (
        Node(
            "I",
            "Intake agent: the venue or the policy anchor, the policy of a venue not listed, "
            "the kinds of AI use the records leave uncertain; you confirm",
            "stop",
        ),
        Node("W", "Draft writer: the statements"),
        Node(
            "W2",
            "Draft writer once more: the model identifier, when the model list gave none or the served one differs",
            "maybe",
        ),
    )
    return _graph(nodes, (Edge("I", "W"), Edge("W", "W2")))


def paper_plan_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("M", "Socratic mentor: given each answer, resumed or started fresh"),
        Node(
            "Q",
            "The mentor's question: each answer; offers after 8 rounds on a chapter "
            "and 30 in all",
            "stop",
        ),
        Node("P1", "Planner: the outline from the chapter summaries"),
        Node("S", "Mentor, Step 2.5: contribution sharpening, one round or more"),
        Node("PE", "Planner: evaluates each stress-test answer"),
        Node("P2", "Planner: the chapter plan"),
        Node("H", "The plan's handoff", "stop"),
    )
    edges = (
        Edge("I", "M"),
        Edge("M", "Q"),
        Edge("Q", "M", "your answer", "back"),
        Edge("M", "P1", "the last chapter summary is written"),
        Edge("P1", "S", "you confirm that summary"),
        Edge("S", "Q", "its questions to you", "back"),
        Edge("Q", "PE", "your answer to a stress-test question"),
        Edge("PE", "M", "the rating goes to the mentor", "back"),
        Edge("M", "P2", "every sub-argument is Moderate or above, or you end it"),
        Edge("P2", "H"),
        Edge("H", "M", "a condition of the gate is not met", "back"),
    )
    return _graph(nodes, edges)


def paper_format_convert_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("F", "Formatter: the patches and the report"),
        Node(
            "F2",
            "Formatter again, for the conversion patch, when the citation style changes",
            "maybe",
        ),
    )
    return _graph(nodes, (Edge("I", "F"), Edge("F", "F2")))


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
)


def paper_figures() -> tuple[tuple[str, str], ...]:
    """The figure of each mode of the paper skill, as its file name and body."""
    return tuple(
        (f"paper/{mode}.svg", _paper(mode, mode, build()))
        for mode, build in PAPER_MODES
    )


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
    stop = Node(
        "SM", "A model other than the configured one, for any of the four", "stop"
    )
    note = "The three finding agents start at once; the checking agent starts after they end."
    return _single(
        "writing.svg", "The writing skill", _graph(nodes, edges, (stop,)), note
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
    stop = Node(
        "SM", "A model other than the configured one, for any of the three", "stop"
    )
    note = "A rewrite is kept only when the code of the file compares equal to its code before."
    return _single(
        "code-comments.svg",
        "The code-comments skill",
        _graph(nodes, edges, (stop,)),
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
    repo = Lane(
        "/repo-setup",
        (
            Node("a", "The questions", "stop"),
            Node("b", "The draft", "stop"),
            Node("c", "A hunk to rule on", "stop"),
            Node("d", "The drafted sync change", "stop"),
            Node("e", "A file sync cannot use", "stop"),
            Node("f", "The check still fails", "stop"),
            Node("g", "No commit allowed", "stop"),
        ),
        columns=2,
    )
    init = Lane(
        "/ordo-init",
        (
            Node("a", "The draft", "stop"),
            Node("b", "Several roadmaps", "stop"),
            Node("c", "Worker, reviewer and libraries", "stop"),
            Node("d", "A failing command", "stop"),
            Node("e", "A fix in the check", "stop"),
            Node("f", "No commit allowed", "stop"),
        ),
        columns=2,
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
            "SET THE REPOSITORY UP, ONCE: ONE OF THE TWO",
            (repo, init),
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
        "These start no agent: /repo-setup, /ordo-init, /roadmap, /plan, /land, /plan-retro, "
        "/session-retro and /ordo-help, which has no stop. A refusal names its cause and "
        "leaves nothing, so it is not drawn."
    )
    return lanes_figure("pipeline.svg", label, rows, SIMPLE_LEGEND, note)


def figures() -> tuple[tuple[str, str], ...]:
    """Every figure of this script, as the file name under docs/figures and its body."""
    return (
        ("pipeline.svg", pipeline()),
        ("plan-loop.svg", plan_loop()),
        ("grill.svg", grill()),
        ("writing.svg", writing()),
        ("code-comments.svg", code_comments()),
        *paper_figures(),
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
