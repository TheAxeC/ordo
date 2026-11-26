"""Draw flow figures as SVG files, with the Python standard library alone.

A flow figure is one or more graphs of boxes and arrows, each laid out in ranks from the top and
drawn side by side under its caption. A lanes figure is rows of lanes, each lane a framed column
of boxes under its caption. Each figure carries its own light panel, so it reads the same on a
light or a dark page, an optional note, a legend, and a text for a reader who cannot see it.

The kinds of box, the kind a Node names:

- agent: a white box with a solid border;
- maybe: a white box with a dashed border;
- stop: an orange box;
- script: a grey box;
- choice: a white box with rounded ends;
- none: a pale box with a red dotted border.

The kinds of arrow, the style an Edge names:

- flow: a solid arrow to a later box;
- dotted: a dotted arrow to a later box;
- back: a dotted arrow to an earlier box;
- return: a solid arrow to an earlier box;
- an edge whose two ends are one box, with the style back or return: a dotted loop on that box,
  with its label beside it.

In a lanes figure a Row draws a solid arrow from each lane to the next unless its arrows are
off, and each of its returns as a dotted arrow under the row from one lane back to an earlier
lane, with its cap.

A script uses it in this order:

1. It puts this file's folder on sys.path, sets sys.dont_write_bytecode so that no __pycache__
   folder is written beside this file, and imports the module.
2. When it draws kinds of box of its own, it builds its mapping of kinds once with
   with_kinds(extra), extra mapping each new kind's name to a Kind(style, words): the Style the
   box is drawn with, and the words describe says for a box of that kind. The result is a new
   read-only mapping of the engine's kinds and the script's own.
3. It builds each graph from Node and Edge values with graph(), or a lanes figure from Lane and
   Row values.
4. It draws each figure with compose(name, describe(title, panels, kinds), panels, legend, note,
   kinds), or with lanes_figure(name, label, rows, legend, note, kinds); each returns the text
   of the SVG file. A script that draws on a Canvas of its own passes kinds to Canvas, which
   draw_node and draw_legend read. Each kinds parameter defaults to KINDS, the engine's
   read-only table. A legend is a sequence of Legend rows, each with a sample and its meaning:
   the sample is a kind of box, "dotted" for a dotted arrow, or "loop" for a dotted loop.
5. It passes the names and texts to write_figures(base, figures, root), which writes each file
   under base and returns one line per file, "wrote <path relative to root> (<n> bytes)".

The module writes no module-level value after import.

The module reads no input file: it reads back only each file it writes, and takes every value
from its caller.

Errors, each raised as FigureError with its message:

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
- a box or a legend row whose kind the mapping of kinds does not hold: the message names the
  figure, or in describe the title, and the kind;
- a kind passed to with_kinds under a name the engine's table already holds, or under "dotted"
  or "loop", the two legend marks: the message names the kind;
- a base folder that does not lie under the root, both resolved: the message names both paths;
- a file whose path does not lie under the base folder: the message names the file and the
  folder;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label and kind errors are raised while a figure is drawn. write_figures checks the base
folder, every file's path and every body for a non-ASCII character before it writes any file,
so every byte written is ASCII and lies under the base folder.

The module imports only the standard library and needs Python 3.10 or later.
"""

from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from html import escape
from itertools import pairwise
from pathlib import Path
from statistics import fmean
from types import MappingProxyType
from typing import NamedTuple

INK = "#0f172a"
MUTED = "#475569"
EDGE = "#64748b"
PANEL = "#f8fafc"
CARD = "#ffffff"
ACCENT = "#4f46e5"
STOP = "#b45309"
STOP_FILL = "#fff1e6"
STOP_INK = "#7c2d12"
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
FLOW_WIDTH = 214


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


class Kind(NamedTuple):
    """A kind of box: how it is drawn, and the words describe says for a box of it."""

    style: Style
    words: str


KINDS: Mapping[str, Kind] = MappingProxyType(
    {
        "agent": Kind(Style(CARD, EDGE, "", INK, 1.5, False), "agent"),
        "maybe": Kind(Style(CARD, EDGE, DASHED, INK, 1.5, False), "agent, only when needed"),
        "stop": Kind(Style(STOP_FILL, STOP, "", STOP_INK, 2, False), "stop"),
        "script": Kind(Style(SCRIPT_FILL, EDGE, "", INK, 1.5, False), "script"),
        "choice": Kind(Style(CARD, EDGE, "", INK, 1.5, True), "question"),
        "none": Kind(Style(PANEL, "#b91c1c", "2 3", "#991b1b", 1.5, False), "none"),
    }
)


LEGEND_MARKS = ("dotted", "loop")


def with_kinds(extra: Mapping[str, Kind]) -> Mapping[str, Kind]:
    """A new read-only mapping of the engine's kinds and the caller's own."""
    for name in extra:
        if name in KINDS:
            raise FigureError(f"the kind {name!r} is one of the engine's kinds")
        if name in LEGEND_MARKS:
            raise FigureError(f"the kind {name!r} is a legend mark, not a kind")
    return MappingProxyType({**KINDS, **extra})


def _kind(figure: str, kinds: Mapping[str, Kind], name: str) -> Kind:
    """The kind of that name, or an error naming the figure and the kind."""
    if name not in kinds:
        raise FigureError(f"{figure}: the kind {name!r} is not one of the figure's kinds")
    return kinds[name]


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


def graph(
    nodes: Sequence[Node],
    edges: Sequence[Edge],
    floating: Sequence[Node] = (),
    width: float = FLOW_WIDTH,
    caption: str = "",
) -> Graph:
    return Graph(tuple(nodes), tuple(edges), tuple(floating), width, caption)


def parts(*labels: str, kind: str = "agent") -> tuple[Node, ...]:
    """A box per label, of one kind, keyed p0, p1 and on in the order given."""
    return tuple(Node(f"p{index}", label, kind) for index, label in enumerate(labels))


def _num(value: float) -> str:
    return f"{value:.1f}".rstrip("0").rstrip(".")


def _em(bold: bool, caps: bool = False) -> float:
    if caps:
        return CAPS_EM
    return BOLD_EM if bold else REGULAR_EM


def wrap(
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

    def __init__(
        self,
        name: str,
        width: float,
        height: float,
        label: str,
        kinds: Mapping[str, Kind] = KINDS,
    ) -> None:
        self.name = name
        self.kinds = kinds
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
    return 10 + len(wrap(name, "a note", note, width, NOTE_SIZE)) * 15


def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    for index, line in enumerate(wrap(canvas.name, "a note", label, width, NOTE_SIZE)):
        canvas.text(x, y + index * 15, line, NOTE_SIZE, MUTED)


def node_height(lines: Sequence[str]) -> float:
    return max(MIN_NODE_HEIGHT, 18 + len(lines) * NODE_LEADING)


def draw_node(canvas: Canvas, area: Rect, kind: str, lines: Sequence[str]) -> None:
    """Draw a box of a kind of the canvas's kinds with its lines centred in it."""
    style = _kind(canvas.name, canvas.kinds, kind).style
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

    def __init__(self, figure: str, flow: Graph) -> None:
        self.figure = figure
        self.graph = flow
        self.width = 0.0
        self.height = 0.0
        self._check_edges()
        self.kind_of = {node.key: node.kind for node in (*flow.nodes, *flow.floating)}
        self.lines = {
            node.key: self._node_lines(node) for node in (*flow.nodes, *flow.floating)
        }
        self.loops = [edge for edge in flow.edges if edge.src == edge.dst]
        self.backs = [
            edge
            for edge in flow.edges
            if edge.style in ("back", "return") and edge.src != edge.dst
        ]
        self.forward = [
            edge for edge in flow.edges if edge.style not in ("back", "return")
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
        lines = wrap(self.figure, f"box {node.key!r}", node.label, width, NODE_SIZE)
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
        if key not in self.kind_of:
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
        lines = wrap(
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
        heights = {key: node_height(lines) for key, lines in self.lines.items()}
        self.heights = heights
        self.row_height = []
        for layer in self.layers:
            real = [heights[key] for key in layer if key in self.kind_of]
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
        for key in self.kind_of:
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
            if key not in self.kind_of:
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
            draw_node(canvas, area, self.kind_of[key], self.lines[key])
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


def draw_legend(canvas: Canvas, x: float, y: float, rows: Sequence[Legend]) -> float:
    """Draw the legend rows, one under another, and return the height used."""
    draw_caption(canvas, x, y, "HOW TO READ THE FIGURE", 400)
    cursor = y + 14
    for row in rows:
        _check_line(
            canvas.name, "the legend", row.meaning, canvas.width - x - 60, NOTE_SIZE
        )
        if row.sample not in LEGEND_MARKS:
            style = _kind(canvas.name, canvas.kinds, row.sample).style
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
    kinds: Mapping[str, Kind] = KINDS,
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
    canvas = Canvas(name, width, height, label, kinds)
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


def describe(
    title: str, panels: Sequence[Panel], kinds: Mapping[str, Kind] = KINDS
) -> str:
    """The text a figure carries for a reader who cannot see it: its boxes in order."""
    texts = []
    for panel in panels:
        boxes = [
            f"{node.label} ({_kind(title, kinds, node.kind).words})"
            for node in (*panel.graph.nodes, *panel.graph.floating)
        ]
        prefix = f"{panel.caption}: " if panel.caption else ""
        texts.append(prefix + "; ".join(boxes))
    return f"{title}. Boxes: " + " | ".join(texts) + "."


def flow_label(title: str, panels: Sequence[Panel]) -> str:
    """The text a flow of files carries for a reader who cannot see it: each hand-off."""
    texts = []
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
        texts.append(prefix + "; ".join(steps))
    return f"{title}. " + " | ".join(texts) + "."


# ---------------------------------------------------------------------------------------
# Lanes: rows of framed columns of boxes, each lane under its caption.


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
            wrap(
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
        height = max(node_height(wrapped) for wrapped in lines)
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
    name: str,
    label: str,
    rows: Sequence[Row],
    legend: Sequence[Legend],
    note: str = "",
    kinds: Mapping[str, Kind] = KINDS,
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
    canvas = Canvas(name, width, height, label, kinds)
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


def lanes_label(title: str, rows: Sequence[Row]) -> str:
    """The text a lanes figure carries for a reader who cannot see it: each lane's boxes."""
    lanes = [
        f"{lane.caption}: " + "; ".join(node.label for node in lane.nodes)
        for row in rows
        for lane in row.lanes
    ]
    return f"{title}. " + " | ".join(lanes) + "."


def write_figures(
    base: Path, figures_to_write: Sequence[tuple[str, str]], root: Path
) -> list[str]:
    """Check every body and path, then write each file under base and read it back.

    Return one line per file, with its path relative to root. Base must lie under root, and
    each file under base, both resolved, or no file is written.
    """
    top = root.resolve()
    folder = base.resolve()
    if not folder.is_relative_to(top):
        raise FigureError(f"the folder {base} is not under the root {root}")
    for name, body in figures_to_write:
        if not (folder / name).resolve().is_relative_to(folder):
            raise FigureError(f"{name}: the file is not under the folder {base}")
        if not body.isascii():
            raise FigureError(f"{name}: the body holds a character that is not ASCII")
    lines: list[str] = []
    for name, body in figures_to_write:
        path = folder / name
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
        lines.append(f"wrote {path.resolve().relative_to(top).as_posix()} ({len(body)} bytes)")
    return lines
